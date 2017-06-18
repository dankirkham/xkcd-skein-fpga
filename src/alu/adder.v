module adder (
  input [63:0] primary_i,
  input [63:0] secondary_i,

  output [63:0] sum_o
);

assign sum_o = primary_i + secondary_i;

endmodule
