module round_counter_register (
	input clk_i,
	input [1:0] chip_mode_i,
	input [3:0] word_counter_i,
	output [6:0] round_counter_o
);

reg [3:0] round_counter_d, round_counter_q;
assign round_counter_o = round_counter_q;

always @(*) begin
	if ((chip_mode_i == 2'b10) && (word_counter_i == 4'd14)) begin
		if (round_counter_q == 7'd80) begin
			round_counter_d = 7'd0;
		end else begin
			round_counter_d = round_counter_q + 7'd1;
		end
	end
end

always @(posedge clk_i) begin
	round_counter_q <= round_counter_d;
end

endmodule