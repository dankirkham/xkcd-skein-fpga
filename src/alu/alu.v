module alu (
  input clk_i,
  input [63:0] input_i,
  input [3:0] opcode_i,

  output [63:0] output_o
);

wire [63:0] input_w;
wire [63:0] primary_register_w;
wire [63:0] secondary_register_w;
wire [9:0] bit_counter_register_w;
wire [9:0] comparator_register_w;
wire [9:0] comparator_demux_w;
wire [63:0] passthrough_demux_w;
wire [63:0] xor_w;
wire [63:0] adder_w;
wire [63:0] output_w;

wire comparator_result_w;

wire [2:0] primary_register_control_w;
wire [1:0] secondary_register_control_w;
wire [1:0] bit_counter_register_control_w;
wire comparator_register_control_w;
wire comparator_demux_control_w;
wire passthrough_demux_control_w;
wire [1:0] output_demux_control_w;

assign output_o = output_w;

primary_register primary_register0 (
  .clk_i(clk_i),
  .control_i(primary_register_control_w),
  .input_i(input_i),
  .primary_register_o(primary_register_w)
);

secondary_register secondary_register0 (
  .clk_i(clk_i),
  .control_i(secondary_register_control_w),
  .input_i(input_i),
  .secondary_register_o(secondary_register_w)
);

bit_counter_register bit_counter_register0 (
  .clk_i(clk_i),
  .write_i(bit_counter_register_control_w[1]),
  .increment_i(bit_counter_register_control_w[0]),
  .primary_register_i(primary_register_w),
  .bit_counter_o(bit_counter_register_w)
);

comparator_register comparator_register0 (
  .clk_i(clk_i),
  .write_i(comparator_register_control_w),
  .secondary_register_i(secondary_register_w),
  .comparator_register_o(comparator_register_w)
);

comparator comparator0 (
	.bit_counter_register_i(bit_counter_register_w),
  .comparator_register_i(comparator_register_w),
	.select_o(comparator_result_w) // Output is bit_counter_register_i < comparator_register_i
);

xor64 xor640 (
	.primary_i(primary_register_w),
  .secondary_i(secondary_register_w),
	.output_o(xor_w)
);

adder adder0 (
  .primary_i(primary_register_w),
  .secondary_i(secondary_register_w),
	.sum_o(adder_w)
);

opcode_decoder opcode_decoder0 (
  .opcode_i(opcode_i),
  .primary_register_control_o(primary_register_control_w),
  .secondary_register_control_o(secondary_register_control_w),
  .bit_counter_register_control_o(bit_counter_register_control_w),
  .comparator_register_control_o(comparator_register_control_w),
  .comparator_demux_control_o(comparator_demux_control_w),
  .passthrough_demux_control_o(passthrough_demux_control_w),
  .output_demux_control_o(output_demux_control_w)
);

passthrough_demux passthrough_demux0 (
  .primary_register_i(primary_register_w),
  .secondary_register_i(secondary_register_w),
  .primary_register_select_i(passthrough_demux_control_w),
  .comparator_select_i(comparator_result_w),
  .output_o(passthrough_demux_w)
);

comparator_demux comparator_demux0 (
  .bit_counter_register_i(bit_counter_register_w),
  .compare_register_i(comparator_register_w),
  .bit_counter_select_i(comparator_demux_control_w),
  .comparator_select_i(comparator_result_w),
  .output_o(comparator_demux_w)
);

output_demux output_demux0 (
  .comparator_demux_i(comparator_demux_w),
  .passthrough_demux_i(passthrough_demux_w),
  .xor_i(xor_w),
  .adder_i(adder_w),
  .select_i(output_demux_control_w),
  .output_o(output_w)
);

endmodule
