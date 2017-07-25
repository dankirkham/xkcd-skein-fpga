module block_ram_test (
  input clk_i,

  // UART Module
  input [7:0] rx_byte_i,
  output [7:0] tx_byte_o,
  input new_rx_data_i,
  output new_tx_data_o,
  input tx_busy_i,

  // RAM
  output [7:0] address_o,
  input [15:0] data_i,
  output [15:0] data_o,
  output write_o
);

assign data_o = data_register_w;

// Internal data wires
wire [15:0] data_register_demux_w;
wire [7:0] byte_select_demux_w;
wire [7:0] header_constant_w;
wire [15:0] data_register_w;

// Internal control wires
wire timeout_timer_reset_w;
wire timeout_timer_timed_out_w;
wire address_register_write_w;
wire data_register_write_low_w;
wire data_register_write_high_w;
wire data_register_demux_select_w;
wire byte_select_select_w;
wire transmit_demux_select_w;

state_machine state_machine0 (
  .clk_i(clk_i),
  .new_rx_data_i(new_rx_data_i),
  .rx_data_i(rx_byte_i),
  .tx_busy_i(tx_busy_i),
  .timeout_timer_timed_out_i(timeout_timer_timed_out_w),
  .header_byte_i(header_constant_w),
  .timeout_timer_reset_o(timeout_timer_reset_w),
  .address_register_write_o(address_register_write_w),
  .data_register_write_low_o(data_register_write_low_w),
  .data_register_write_high_o(data_register_write_high_w),
  .new_tx_data_o(new_tx_data_o),
  .write_o(write_o),
  .data_register_demux_o(data_register_demux_select_w),
  .byte_select_demux_o(byte_select_select_w),
  .transmitter_demux_o(transmit_demux_select_w)
);

address_register address_register0 (
  .clk_i(clk_i),
  .write_i(address_register_write_w),
  .input_i(rx_byte_i),
  .output_o(address_o)
);

data_register data_register0 (
  .clk_i(clk_i),
  .write_low_i(data_register_write_low_w),
  .write_high_i(data_register_write_high_w),
  .input_i(data_register_demux_w),
  .output_o(data_register_w)
);

timeout_timer timeout_timer0 (
  .clk_i(clk_i),
  .reset_i(timeout_timer_reset_w),
  .timed_out_o(timeout_timer_timed_out_w)
);

data_register_demux data_register_demux0 (
  .data_word_i(data_i),
  .rx_byte_i(rx_byte_i),
  .select_i(data_register_demux_select_w),
  .output_o(data_register_demux_w)
);

byte_select_demux byte_select_demux0 (
  .data_word_i(data_register_w),
  .select_i(byte_select_select_w),
  .output_o(byte_select_demux_w)
);

transmit_demux transmit_demux0 (
  .data_i(byte_select_demux_w),
  .header_i(header_constant_w),
  .select_i(transmit_demux_select_w),
  .output_o(tx_byte_o)
);

header_constant header_constant0 (
  .output_o(header_constant_w)
);

endmodule
