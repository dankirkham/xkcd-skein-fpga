module comparator_register (
  input clk_i,
  input write_i,

  input [63:0] secondary_register_i,

  output [9:0] comparator_register_o
);

reg [9:0] comparator_register_d, comparator_register_q;
assign comparator_register_o = comparator_register_q;

always @(*) begin
  if (write_i)
    comparator_register_d = secondary_register_i[9:0];
  else
    comparator_register_d = comparator_register_q;
end

always @(posedge clk_i) begin
  comparator_register_q <= comparator_register_d;
end

endmodule
