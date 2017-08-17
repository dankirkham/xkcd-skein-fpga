module core_sim #(
  parameter CORE_ID /*verilator public*/ = 0
  ) (
  input clk_i,
  input [63:0] input_i,
  input [17:0] instruction_i,
  output [63:0] output_o,

  // Exposed for Verilator debugging.
  output [15:0] ram_output_o,
  output [15:0] ram_input_o,
  output ram_write_o,
  output [7:0] ram_address_o
);

wire [15:0] ram_output_w;
wire [15:0] ram_input_w;

wire [7:0] address_w;
wire write_w;
wire [3:0] alu_opcode_w;
wire [1:0] input_select_w;
wire output_select_w;
wire output_enable_w;
wire save_core_selection_w;

assign save_core_selection_w = instruction_i[17];
assign write_w = instruction_i[16];
assign address_w = instruction_i[15:8] ;
assign input_select_w = instruction_i[7:6];
assign output_select_w = instruction_i[5];
assign output_enable_w = instruction_i[4];
assign alu_opcode_w = instruction_i[3:0];


// Exposed for Verilator debugging.
assign ram_output_o = ram_output_w;
assign ram_input_o = ram_input_w;
assign ram_write_o = write_w;
assign ram_address_o = address_w;

block_ram block_ram0 (
  .clk_i(clk_i),
  .write_i(write_w),
  .data_i(ram_input_w),
  .address_i(address_w),
  .data_o(ram_output_w)
);

core #(.CORE_ID(CORE_ID)) core0 (
  .clk_i(clk_i),
  .ram_i(ram_output_w),
  .input_i(input_i),
  .save_selection_i(save_core_selection_w),
  .output_enable_i(output_enable_w),
  .input_select_i(input_select_w),
  .alu_opcode_i(alu_opcode_w),
  .output_select_i(output_select_w),
  .ram_o(ram_input_w),
  .output_o(output_o)
);

endmodule
