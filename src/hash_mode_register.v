module hash_mode_register (
	input clk_i,
	input [1:0] chip_mode_i,
	input [3:0] word_counter_i,
	input [6:0] round_counter_i,
	output hash_mode_o
);

reg hash_mode_d, hash_mode_q;

always @(*) begin
	if ((chip_mode_i == 2'b10) && (word_counter_i == 4'd14) && (round_counter_i == 7'd80)) begin
		hash_mode_d = ~hash_mode_q;
	end else begin
		hash_mode_d = hash_mode_q;
	end
end

always @(posedge clk_i) begin
	hash_mode_q <= hash_mode_d;
end

endmodule