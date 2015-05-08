module serial_interface (
  input clk_i,
  input rx_new_i,
  input [7:0] rx_data_i,
  input tx_busy_i,
  input nonce_ready_i,
  input [255:0] nonce_i,
  input [9:0] nonce_bits_off_i,
  output tx_new_o,
  output [7:0] tx_data_o,
  output nonce_receive_o,
  output chip_enabled_o,
  output reset_best_nonce_o
);

wire timeout_counter_reset;
wire timeout_counter_timed_out;
wire chip_start;
wire chip_stop;
wire chip_enabled;
wire ping_queue;
wire ping_send;
wire ping_sent;
wire nonce_send;
wire nonce_sent;
wire nonce_receive;
wire decrement_byte_counter_shift_transmit_buffer;
wire [7:0] nonce_byte;
wire byte_counter_reset;
wire byte_counter_zero;

assign chip_enabled_o = chip_enabled;
assign nonce_receive_o = nonce_receive;
assign reset_best_nonce_o = nonce_send;

receiver receiver (
	.clk_i(clk_i),
	.new_data_i(rx_new_i),
	.data_i(rx_data_i),
	.timed_out_i(timeout_counter_timed_out),
	.nonce_register_ready_i(nonce_ready_i),
	.timeout_counter_reset_o(timeout_counter_reset),
	.start_o(chip_start),
	.stop_o(chip_stop),
	.ping_o(ping_queue),
	.nonce_o(nonce_receive)
);

transmitter transmitter (
	.clk_i(clk_i),
	.tx_busy_i(tx_busy_i),
	.send_nonce_i(nonce_send),
	.send_ping_i(ping_send),
	.byte_counter_zero_i(byte_counter_zero),
	.chip_enabled_i(chip_enabled),
	.nonce_byte_i(nonce_byte),
  .nonce_bits_off_i(nonce_bits_off_i),

	.tx_new_o(tx_new_o),
	.tx_data_o(tx_data_o),
	.reset_ping_waiting_o(ping_sent),
	.reset_nonce_waiting_o(nonce_sent),
	.reset_byte_counter_o(byte_counter_reset),
	.decrement_byte_counter_o(decrement_byte_counter_shift_transmit_buffer)
);

transmitter_buffer transmitter_buffer (
  .clk_i(clk_i),
  .nonce_i(nonce_i),
  .shift_i(decrement_byte_counter_shift_transmit_buffer),
  .write_i(nonce_send),
  .byte_o(nonce_byte)
);

nonce_register_byte_counter nonce_register_byte_counter (
	.clk_i(clk_i),
	.reset_i(byte_counter_reset),
	.decrement_i(decrement_byte_counter_shift_transmit_buffer),
	.zero_o(byte_counter_zero)
);

timeout_counter timeout_counter (
	.clk_i(clk_i),
	.reset_i(timeout_counter_reset),
	.timed_out_o(timeout_counter_timed_out)
);

timeout_counter nonce_send_counter (
	.clk_i(clk_i),
	.reset_i(nonce_sent),
	.timed_out_o(nonce_send)
);

chip_enable chip_enable (
	.clk_i(clk_i),
	.start_i(chip_start),
	.stop_i(chip_stop),
	.running_o(chip_enabled)
);

ping_waiting_register ping_waiting_register (
	.clk_i(clk_i),
	.send_ping_i(ping_queue),
	.reset_ping_waiting_i(ping_sent),
	.ping_waiting_o(ping_send)
);

endmodule
