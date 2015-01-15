module core (
	input clk_i,
	input rst_i,
	input input_register_write_i,
	input [3:0] word_i,
	input x0_key_select_i,
	input [1:0] x1_tweak_subkey_select_i,
	input [63:0] tweak_word_i,
	input [7:0] rotate_constant_i,
	input [15:0] Y1_select_i,
	input [15:0] output_register_write_i,
	input key_register_write_i,
	input hash_mode_i,
	input subkey_write_i,
	input output_register_plaintext_select_i,
	input [255:0] nonce_i,
	input [1023:0] key_constant_i,
	input [4:0] subkey_i,
	input hash_register_write_i,
	output reg [1023:0] hash_register_o
);

wire [1023:0] input_register_o_w;
wire [63:0] input_x0_select_o_w;
wire [63:0] input_x1_select_o_w;
wire [31:0] core_constant_temp_o_w;
wire [1023:0] plaintext_select_o_w;
wire [1023:0] output_register_block_o_w;
wire [1023:0] output_register_plaintext_select_o_w;
wire [63:0] subkey_selector_o_w;
wire [1023:0] key_register_o_w;
wire [1023:0] key_select_o_w;
wire [1087:0] key_extend_o_w;
wire [63:0] key_word_select_o_w;
wire [63:0] x0_key_select_o_w;
wire [63:0] x1_tweak_subkey_select_o_w;
wire [63:0] adder64simple_o_w;
wire [63:0] rotator_o_w;
wire [63:0] xor_o_w;
wire [1023:0] xor2_o_w;
wire [1023:0] output_select_block_o_w;
wire [3:0] subkey_selector_key_word_select_w;

assign xor_o_w = adder64simple_o_w ^ rotator_o_w;
assign xor2_o_w = output_register_block_o_w ^ plaintext_select_o_w;
	
input_register input_register (
	.clk_i(clk_i),
	.write_i(input_register_write_i),
	.state_i(output_register_plaintext_select_o_w),
	.state_o(input_register_o_w)
);
	
input_x0_select input_x0_select (
	.input_register_i(input_register_o_w),
	.word_i(word_i),
	.x0_o(input_x0_select_o_w)
);

input_x1_select input_x1_select (
	.input_register_i(input_register_o_w),
	.word_i(word_i),
	.x1_o(input_x1_select_o_w)
);

x0_key_select x0_key_select (
	.mode_i(x0_key_select_i),
	.x0_i(input_x0_select_o_w),
	.key_i(key_word_select_o_w),
	.selected_o(x0_key_select_o_w)
);

x1_tweak_subkey_select x1_tweak_subkey_select (
	.mode_i(x1_tweak_subkey_select_i),
	.x1_i(input_x1_select_o_w),
	.tweak_i(tweak_word_i),
	.subkey_i(subkey_selector_o_w),
	.selected_o(x1_tweak_subkey_select_o_w)
);

rotator rotator (
	.word_i(x1_tweak_subkey_select_o_w),
	.rotate_bits_i(rotate_constant_i),
	.rotated_word_o(rotator_o_w)
);

adder64simple adder64simple(
	.operand1_i(x0_key_select_o_w),
	.operand2_i(x1_tweak_subkey_select_o_w),
	.sum_o(adder64simple_o_w)
);

output_select_block output_select_block (
	.Y1_bits_i(Y1_select_i),
	.Y0_i(adder64simple_o_w),
	.Y1_i(xor_o_w),
	.output_o(output_select_block_o_w)
);

output_register_block output_register_block (
	.clk_i(clk_i),
	.write_bits_i(output_register_write_i),
	.input_i(output_select_block_o_w),
	.output_o(output_register_block_o_w)
);
	
key_register key_register (
	.clk_i(clk_i),
	.write_i(key_register_write_i),
	.key_i(xor2_o_w),
	.key_o(key_register_o_w)
);

key_select key_select (
	.mode_i(hash_mode_i),
	.key_register_i(key_register_o_w),
	.key_constant_i(key_constant_i),
	.key_o(key_select_o_w)
);

key_extend key_extend (
	.key_i(key_select_o_w),
	.key_o(key_extend_o_w)
);

key_word_select key_word_select (
	.select_i(subkey_selector_key_word_select_w),
	.key_i(key_extend_o_w),
	.key_word_o(key_word_select_o_w)
);

subkey_selector subkey_selector (
	.clk_i(clk_i),
	.rst_i(rst_i),
	.subkey_select_i(subkey_i),
	.subkey_word_select_i(word_i),
	.write_i(subkey_write_i),
	.add64_word_i(adder64simple_o_w),
	.key_word_i(key_word_select_o_w),
	.key_word_select_o(subkey_selector_key_word_select_w),
	.word_o(subkey_selector_o_w)
);
	
core_constant_temp core_constant_temp (
	.core_o(core_constant_temp_o_w)
);

output_register_plaintext_select output_register_plaintext_select (
	.mode_i(output_register_plaintext_select_i),
	.output_register_i(output_register_block_o_w),
	.plaintext_i(plaintext_select_o_w),
	.state_o(output_register_plaintext_select_o_w)
);

plaintext_select plaintext_select (
	.mode_i(hash_mode_i),
	.nonce_i(nonce_i),
	.core_i(core_constant_temp_o_w),
	.plaintext_o(plaintext_select_o_w)
);

hash_register hash_register(
	.clk_i(clk_i),
	.input_i(xor2_o_w),
	.write_i(hash_register_write_i),
	.output_o(hash_register_o)
);

endmodule