module timeout_counter (
	input clk_i,
	input reset_i,
	output reg timed_out_o
);

reg [27:0] counter_d, counter_q;

always @(*) begin
	if (reset_i)
		counter_d = 28'd250000000;
	else
		counter_d = counter_q - 28'd1;
	
	if (counter_q == 28'd0)
		timed_out_o = 1'b1;
	else
		timed_out_o = 1'b0;
end

always @(posedge clk_i) begin
	counter_q <= counter_d;
end

endmodule