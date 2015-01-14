module debug_register (
	input clk_i,
	input [1023:0] input_i,
	input write_i,
	output [1023:0] output_o
	);
	
reg [1023:0] output_d, output_q;
assign output_o = output_q;

always @(*) begin
	if (write_i) begin
		output_d = input_i;
	end else begin
		output_d = output_q;
	end
end

always @(posedge clk_i) begin
	output_q <= output_d;
end

endmodule