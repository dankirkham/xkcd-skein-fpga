module core_id_module #(
  parameter CORE_ID = 0
  )(
  input clk_i,
  input [23:0] core_selection_i,
  input save_selection_i,
  input output_enable_i,

  output [23:0] core_id_o,
  output output_enable_o
);

wire [23:0] core_id_w;
wire comparator_w;
wire select_bit_w;

assign core_id_o = core_id_w;
assign output_enable_o = output_enable_i & select_bit_w;

core_id #(.CORE_ID(CORE_ID)) core_id0 (
    .core_id_o(core_id_w)
);

core_id_comparator core_id_comparator0 (
    .core_id_i(core_id_w),
    .core_selection_i(core_selection_i),
    .equals_o(comparator_w)
);

select_bit select_bit0 (
  .clk_i(clk_i),
  .comparator_i(comparator_w),
  .save_selection_i(save_selection_i),
  .output_o(select_bit_w)
);

endmodule
