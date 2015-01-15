module round_counter (
	input clk_i,
	input increment_i,
	input reset_i,
	output [6:0] round_counter_o
);

reg [6:0] round_counter_d, round_counter_q;
assign round_counter_o = round_counter_q;

always @(*) begin
	if (increment_i == 1'b1)
		round_counter_d = round_counter_q + 7'd1;
	else if (reset_i == 1'b1)
		round_counter_d = 7'd0;
	else
		round_counter_d = round_counter_q;
end

always @(posedge clk_i) begin
	round_counter_q <= round_counter_d;
end

endmodule