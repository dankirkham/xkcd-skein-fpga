module nonce_module (
  input clk_i,
  input [7:0] rx_byte_i,
  input shift_in_i,
  input ready_i,

  input increment_i,
  input nonce_address_i,
  input output_enable_i,

  output [63:0] output_o
);

wire [95:0] nonce_register_w;
wire [47:0] word_select_mux_w;
wire [63:0] base64encoder_w;

nonce_register nonce_register0 (
  .clk_i(clk_i),
  .rx_byte_i(rx_byte_i),
  .shift_in_i(shift_in_i),
  .increment_i(increment_i),
  .ready_i(ready_i),
  .output_o(nonce_register_w)
);

base64encoder_x6 base64encoder_x60 (
	.input_i(word_select_mux_w),
	.output_o(base64encoder_w)
);

word_select_mux word_select_mux0 (
  .low_word_i(nonce_register_w[47:0]),
  .high_word_i(nonce_register_w[95:48]),
  .select_i(nonce_address_i),
  .output_o(word_select_mux_w)
);

output_enable output_enable0 (
  .input_i(base64encoder_w),
  .enable_i(output_enable_i),
  .output_o(output_o)
);

endmodule
