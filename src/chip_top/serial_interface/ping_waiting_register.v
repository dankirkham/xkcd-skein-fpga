module ping_waiting_register (
	input clk_i,
	input send_ping_i,
	input reset_ping_waiting_i,
	output ping_waiting_o
);

reg waiting_d, waiting_q;
assign ping_waiting_o = waiting_q;

always @(*) begin
	waiting_d = waiting_q;

	if (send_ping_i)
		waiting_d = 1'b1;
	else if (reset_ping_waiting_i)
		waiting_d = 1'b0;
end

always @(posedge clk_i) begin
	waiting_q <= waiting_d;
end

endmodule