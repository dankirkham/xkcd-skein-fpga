module core #(
  parameter CORE_ID /*verilator public*/ = 0
  )(
  input clk_i,
  input [15:0] ram_i,
  input [63:0] input_i,

  // Core ID Module
  input save_selection_i,
  input output_enable_i,

  // Input Mux
  input [1:0] input_select_i,

  // ALU
  input [3:0] alu_opcode_i,

  // Output Mux
  input output_select_i,

  output [15:0] ram_o,
  output [63:0] output_o
);

wire [23:0] core_id_w;
wire output_enable_w;
wire [63:0] input_mux_w;
wire [63:0] alu_output_w;
wire [63:0] output_mux_w;

assign ram_o = output_mux_w[15:0];

alu alu0 (
  .clk_i(clk_i),
  .input_i(input_mux_w),
  .opcode_i(alu_opcode_i),
  .output_o(alu_output_w)
);

core_input_mux core_input_mux0 (
  .alu_input_i(input_i),
  .core_id_i(core_id_w),
  .ram_i(ram_i),
  .select_i(input_select_i),
  .output_o(input_mux_w)
);

core_output_mux core_output_mux0 (
  .alu_output_i(alu_output_w),
  .ram_i(ram_i),
  .select_i(output_select_i),
  .output_o(output_mux_w)
);

core_id_module #(.CORE_ID(CORE_ID)) core_id_module (
  .clk_i(clk_i),
  .core_selection_i(input_i[23:0]),
  .save_selection_i(save_selection_i),
  .output_enable_i(output_enable_i),
  .core_id_o(core_id_w),
  .output_enable_o(output_enable_w)
);

core_output_enable core_output_enable0 (
  .input_i(output_mux_w),
  .enable_i(output_enable_w),
  .output_o(output_o)
);

endmodule
