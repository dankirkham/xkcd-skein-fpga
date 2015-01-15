module hash_mode_register (
	input clk_i,
	input toggle_i,
	output hash_mode_o
);

reg hash_mode_d, hash_mode_q;
assign hash_mode_o = hash_mode_q;

always @(*) begin
	if (toggle_i == 1'b1)
		hash_mode_d = ~hash_mode_q;
	else
		hash_mode_d = hash_mode_q;
end

always @(posedge clk_i) begin
	hash_mode_q <= hash_mode_d;
end

endmodule