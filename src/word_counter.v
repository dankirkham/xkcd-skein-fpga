module word_counter (
	input clk_i,
	input word_counter_reset_o,
	input word_counter_plus_1_o,
	input word_counter_plus_2_o,
	
	output [3:0] word_counter_o;
);

reg [3:0] word_counter_d, word_counter_q;
assign word_counter_o = word_counter_q;

always @(*) begin
	if (word_counter_reset_o == 1'b1)
		word_counter_d = 4'd0;
	else if (word_counter_plus_1_o == 1'b1)
		word_counter_d = word_counter_q + 4'd1;
	else if (word_counter_plus_2_o == 1'b1)
		word_counter_d = word_counter_q + 4'd2;
	else
		word_counter_d = word_counter_q;
end

always @(posedge clk_i) begin
	word_counter_q <= word_counter_d;
end

endmodule