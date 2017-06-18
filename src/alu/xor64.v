module xor64 (
	input [63:0] primary_i,
  input [63:0] secondary_i,

	output [63:0] output_o
);

assign output_o = primary_i ^ secondary_i;

endmodule
