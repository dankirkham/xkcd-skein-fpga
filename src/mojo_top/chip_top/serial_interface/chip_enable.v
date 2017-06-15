module chip_enable (
	input clk_i,
	input start_i,
	input stop_i,
	output running_o
);

reg running_d, running_q;
assign running_o = running_q;

always @(*) begin
	if (start_i)
		running_d = 1'b1;
	else if (stop_i)
		running_d = 1'b0;
	else
		running_d = running_q;
end

always @(posedge clk_i) begin
	running_q <= running_d;
end

endmodule