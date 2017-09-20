module serial_transmitter (
  input clk_i,
  input [7:0] ram_i,
  output [4:0] ram_address_o,

  input tx_busy_i,
  output new_tx_data_o,
  output [7:0] tx_data_o,

  input [7:0] header_byte_i,
  input [7:0] status_byte_i,

  input transmit_i
);

wire [4:0] ram_address_w;
wire address_reset_w;
wire address_increment_w;

assign ram_address_o = ram_address_w;

serial_transmitter_state_machine serial_transmitter_state_machine0 (
  .clk_i(clk_i),
  .transmit_i(transmit_i),
  .new_tx_data_o(new_tx_data_o),
  .tx_byte_o(tx_data_o),
  .tx_busy_i(tx_busy_i),
  .ram_i(ram_i),
  .address_reset_o(address_reset_w),
  .address_increment_o(address_increment_w),
  .address_i(ram_address_w),
  .header_byte_i(header_byte_i),
  .status_byte_i(status_byte_i)
);

address_register address_register0 (
  .clk_i(clk_i),
  .increment_i(address_increment_w),
  .reset_i(address_reset_w),
  .count_o(ram_address_w)
);

endmodule
