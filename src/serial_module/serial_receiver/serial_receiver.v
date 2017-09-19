module serial_receiver (
  input clk_i,

  input [7:0] header_constant_i,
  input [7:0] rx_byte_i,
  input new_rx_byte_i,
  output [7:0] nonce_byte_o,
  output nonce_shift_in_o,
  output nonce_ready_o
);

wire [3:0] nonce_counter_w;
wire timeout_timer_timed_out_w;
wire timeout_timer_reset_w;
wire nonce_counter_zero_w;
wire nonce_counter_increment_and_shift_in_w;
wire nonce_ready_w;
wire nonce_ready_state_machine_w;
wire nonce_ready_set_w;

assign nonce_byte_o = rx_byte_i;
assign nonce_shift_in_o = nonce_counter_increment_and_shift_in_w;
assign nonce_ready_o = nonce_ready_w;

serial_receiver_state_machine serial_receiver_state_machine0 (
  .clk_i(clk_i),
  .new_rx_data_i(new_rx_byte_i),
  .rx_data_i(rx_byte_i),
  .header_byte_i(header_constant_i),
  .nonce_counter_i(nonce_counter_w),
  .timeout_timer_timed_out_i(timeout_timer_timed_out_w),
  .timeout_timer_reset_o(timeout_timer_reset_w),
  .nonce_counter_zero_o(nonce_counter_zero_w),
  .nonce_counter_increment_and_shift_in_o(nonce_counter_increment_and_shift_in_w),
  .nonce_ready_o(nonce_ready_state_machine_w),
  .nonce_ready_set_o(nonce_ready_set_w)
);

nonce_counter nonce_counter0 (
  .clk_i(clk_i),
  .zero_i(nonce_counter_zero_w),
  .increment_i(nonce_counter_increment_and_shift_in_w),
  .count_o(nonce_counter_w)
);

serial_receiver_timeout_timer serial_receiver_timeout_timer0 (
  .clk_i(clk_i),
  .reset_i(timeout_timer_reset_w),
  .timed_out_o(timeout_timer_timed_out_w)
);

nonce_ready_register nonce_ready_register0 (
  .clk_i(clk_i),
  .nonce_ready_i(nonce_ready_state_machine_w),
  .nonce_ready_set_i(nonce_ready_set_w),
  .nonce_ready_o(nonce_ready_w)
);

endmodule
