module serial_module (
  input clk_i,

  // Block RAM
  output [4:0] ram_address_o,
  input [7:0] ram_data_i,

  // AVR Interface
  output [7:0] tx_data_o,
  output new_tx_data_o,
  input tx_busy_i,
  input [7:0] rx_data_i,
  input new_rx_data_i,

  // Nonce Module
  output [7:0] rx_byte_o,
  output shift_in_o,
  output ready_o,

  // Best Nonce Module
  output reset_best_nonce_module_o
);

wire [7:0] header_constant_w;

header_constant header_constant0 (
  .output_o(header_constant_w)
);


serial_transmitter serial_transmitter0 (
  .clk_i(clk_i),
  .ram_i(ram_data_i),
  .ram_address_o(ram_address_o),
  .tx_busy_i(tx_busy_i),
  .new_tx_data_o(new_tx_data_o),
  .tx_data_o(tx_data_o),
  .header_byte_i(header_constant_w),
  .status_byte_i(),
  .transmit_i(transmit_w),
  .reset_best_nonce_module_o(reset_best_nonce_module_o)
);

serial_receiver serial_receiver0 (
  .clk_i(clk_i),
  .header_constant_i(header_constant_w),
  .rx_byte_i(rx_data_i),
  .new_rx_byte_i(new_rx_data_i),
  .nonce_byte_o(rx_byte_o),
  .nonce_shift_in_o(shift_in_o),
  .nonce_ready_o(ready_o)
);

endmodule
