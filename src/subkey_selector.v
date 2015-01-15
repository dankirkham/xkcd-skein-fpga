module subkey_selector (
	input clk_i,
	input rst_i,
	input [4:0] subkey_select_i,
	input [3:0] subkey_word_select_i,
	input write_i,
	input [63:0] add64_word_i,
	input [63:0] key_word_i,
	output [3:0] key_word_select_o,
	output [63:0] word_o
    );
	
reg [4:0] key_word_select;

wire control_13_w;
wire control_14_w;
wire control_15_w;
wire subkey_word_13_w;
wire subkey_word_14_w;
wire subkey_word_15_w;
	
assign key_word_select_o = key_word_select;

subkey_word_select_demux subkey_word_select_demux (
	.select_i(subkey_word_select_i),
	.control_i(write_i),
	.control_13_o(control_13_w),
	.control_14_o(control_14_w),
	.control_15_o(control_15_w)
    );
	
subkey_register subkey_register13 (
	.clk_i(clk_i),
	.rst_i(rst_i),
	.write_i(control_13_w),
	.word_i(add64_word_i),
	
	.subkey_o(subkey_word_13_w)
    );
	
subkey_register subkey_register14 (
	.clk_i(clk_i),
	.rst_i(rst_i),
	.write_i(control_14_w),
	.word_i(add64_word_i),
	
	.subkey_o(subkey_word_14_w)
    );
	
subkey_register subkey_register15 (
	.clk_i(clk_i),
	.rst_i(rst_i),
	.write_i(control_15_w),
	.word_i(add64_word_i),
	
	.subkey_o(subkey_word_15_w)
    );
	
subkey_word_select_mux subkey_word_select_mux (
	.select_i(subkey_word_select_i),
	.word_default_i(key_word_i),
	.word_13_i(subkey_word_13_w),
	.word_14_i(subkey_word_14_w),
	.word_15_i(subkey_word_15_w),
	.word_o(word_o)
    );
	
always @(*) begin
	key_word_select = (subkey_select_i + subkey_word_select_i) % 17;
end

endmodule