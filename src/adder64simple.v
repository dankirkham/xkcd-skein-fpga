module adder64simple(
	input [63:0] operand1_i,
	input [63:0] operand2_i,
	output [63:0] sum_o
    );
	 
reg [63:0] sum;

assign sum_o = sum;

always @(*) begin
	sum[63:0] = operand1_i[63:0] + operand2_i[63:0];
end

endmodule