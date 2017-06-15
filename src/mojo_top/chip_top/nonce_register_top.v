module nonce_register_top (
	input clk_i,
	input receive_new_nonce_i,
	input increment_i,
	input rx_new_i,
	input [7:0] rx_data_i,
	output ready_o,
	output [255:0] nonce_o
);

wire [255:0] nonce_w, incremented_nonce_w;
wire ready_w;
wire byte_counter_zero_w;
wire byte_counter_reset_w;
wire shift_in_byte_decrement_byte_and_reset_timeout_w;
wire timed_out_w;

assign ready_o = ready_w;
assign nonce_o = nonce_w;

nonce_register_control nonce_register_control (
	.clk_i(clk_i),
	.receive_new_nonce_i(receive_new_nonce_i),
	.timed_out_i(timed_out_w),
	.byte_counter_zero_i(byte_counter_zero_w),
	.rx_new_i(rx_new_i),
	.nonce_register_ready_o(ready_w),
	.byte_counter_reset_o(byte_counter_reset_w),
	.nonce_register_shift_in_byte_decrement_byte_and_reset_timeout_o(shift_in_byte_decrement_byte_and_reset_timeout_w)
);

nonce_register nonce_register (
	.clk_i(clk_i),
	.increment_i(increment_i),
	.shift_in_rx_data_i(shift_in_byte_decrement_byte_and_reset_timeout_w),
	.ready_i(ready_w),
	.incremented_nonce_i(incremented_nonce_w),
	.rx_data_i(rx_data_i),
	.nonce_o(nonce_w)
);

nonce_increment nonce_increment (
	.nonce_i(nonce_w),
	.incremented_nonce_o(incremented_nonce_w)
);

nonce_register_byte_counter nonce_register_byte_counter (
	.clk_i(clk_i),
	.reset_i(byte_counter_reset_w),
	.decrement_i(shift_in_byte_decrement_byte_and_reset_timeout_w),
	.zero_o(byte_counter_zero_w)
);

timeout_counter timeout_counter (
	.clk_i(clk_i),
	.reset_i(shift_in_byte_decrement_byte_and_reset_timeout_w),
	.timed_out_o(timed_out_w)
);


endmodule