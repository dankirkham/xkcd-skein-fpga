module xkcd_skein_processor #(
  parameter CORE_COUNT /*verilator public*/ = 4
  )(
  input clk_i,
  input rst_i,
  input [20:0] instruction_i,

  // AVR Interface
  output [7:0] tx_data_o,
  output new_tx_data_o,
  input tx_busy_i,
  input [7:0] rx_data_i,
  input new_rx_data_i
);

wire [63:0] main_bus_w;

wire [7:0] address_w;
wire write_w;
wire [3:0] alu_opcode_w;
wire [1:0] input_select_w;
wire output_select_w;
wire output_enable_w;
wire save_core_selection_w;
wire transmit_w;
wire increment_nonce_w;
wire best_nonce_module_save_selection_w;
wire constants_rom_ouput_enable_w;
wire nonce_module_ouput_enable_w;
wire reset_best_nonce_w;
wire [7:0] nonce_module_rx_byte_w;
wire nonce_module_shift_in_w;
wire nonce_module_ready_w;
wire best_nonce_module_ram_write_enable_w;
wire [3:0] best_nonce_module_ram_address_w;
wire [15:0] best_nonce_module_ram_read_w;
wire [15:0] best_nonce_module_ram_write_w;
wire [4:0] serial_module_ram_address_w;
wire [7:0] serial_module_ram_data_w;

assign save_core_selection_w = instruction_i[17];
assign write_w = instruction_i[16];
assign address_w = instruction_i[15:8];
assign input_select_w = instruction_i[7:6];
assign output_select_w = instruction_i[5];
assign output_enable_w = instruction_i[4];
assign alu_opcode_w = instruction_i[3:0];

wire [15:0] core0_ram_o_w;
wire [15:0] core0_ram_i_w;

global_command_decoder global_command_decoder0 (
  .global_command_i(instruction_i[20:18]),
  .increment_nonce_o(increment_nonce_w),
  .best_nonce_module_save_selection_o(best_nonce_module_save_selection_w),
  .transmit_o(transmit_w),
  .constants_rom_ouput_enable_o(constants_rom_ouput_enable_w),
  .nonce_module_ouput_enable_o(nonce_module_ouput_enable_w)
);

core #(.CORE_ID(0)) core0 (
  .clk_i(clk_i),
  .ram_i(core0_ram_i_w),
  .input_i(main_bus_w),
  .save_selection_i(save_core_selection_w),
  .output_enable_i(output_enable_w),
  .input_select_i(input_select_w),
  .alu_opcode_i(alu_opcode_w),
  .output_select_i(output_select_w),
  .ram_o(core0_ram_o_w),
  .output_o(main_bus_w)
);

block_ram block_ram0 (
  .clk_i(clk_i),
  .write_i(write_w),
  .data_i(core0_ram_o_w),
  .address_i(address_w),
  .data_o(core0_ram_i_w)
);

constants_rom constants_rom0 (
  .address_i(address_w[5:0]),
  .output_enable_i(constants_rom_ouput_enable_w),
  .constant_o(main_bus_w)
);

best_nonce_module best_nonce_module0 (
  .clk_i(clk_i),
  .rst_i(rst_i),
  .save_selection_i(best_nonce_module_save_selection_w),
  .main_bus_i(main_bus_w[23:0]),
  .reset_best_nonce_i(reset_best_nonce_w),
  .ram_i(best_nonce_module_ram_read_w),
  .ram_o(best_nonce_module_ram_write_w),
  .ram_address_o(best_nonce_module_ram_address_w),
  .ram_write_o(best_nonce_module_ram_write_enable_w)
);

block_ram_tdp block_ram_best_nonce (
  .clk_i(clk_i),
  .write_i(best_nonce_module_ram_write_enable_w),
  .data_i(best_nonce_module_ram_write_w),
  .address_i({ 4'b0000, best_nonce_module_ram_address_w }),
  .data_o(best_nonce_module_ram_read_w),
  .address_2_i({ 4'b0000, serial_module_ram_address_w }),
  .data_2_o(serial_module_ram_data_w)
);

serial_module serial_module0 (
  .clk_i(clk_i),

  // Block RAM
  .ram_address_o(serial_module_ram_address_w),
  .ram_data_i(serial_module_ram_data_w),

  // AVR Interface
  .tx_data_o(tx_data_o),
  .new_tx_data_o(new_tx_data_o),
  .tx_busy_i(tx_busy_i),
  .rx_data_i(rx_data_i),
  .new_rx_data_i(new_rx_data_i),

  // Nonce Module
  .rx_byte_o(nonce_module_rx_byte_w),
  .shift_in_o(nonce_module_shift_in_w),
  .ready_o(nonce_module_ready_w),

  // Best Nonce Module
  .reset_best_nonce_module_o(reset_best_nonce_w),

  .transmit_i(transmit_w)
);

nonce_module nonce_module0 (
  .clk_i(clk_i),
  .rx_byte_i(nonce_module_rx_byte_w),
  .shift_in_i(nonce_module_shift_in_w),
  .ready_i(nonce_module_ready_w),
  .increment_i(increment_nonce_w),
  .nonce_address_i(instruction_i[8]),
  .output_enable_i(nonce_module_ouput_enable_w),
  .output_o(main_bus_w)
);

endmodule
