module select_bit (
  input clk_i,

  input comparator_i,
  input save_selection_i,
  output output_o
);

reg bit_d, bit_q;

assign output_o = bit_q;

always @(*) begin
  if (save_selection_i)
    bit_d = comparator_i;
  else
    bit_d = bit_q;
end

always @(posedge clk_i) begin
  bit_q <= bit_d;
end

endmodule
