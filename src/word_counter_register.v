module word_counter_register (
	input clk_i,
	input [1:0] chip_mode_i,
	output [3:0] word_counter_o
);

reg [3:0] word_counter_d, word_counter_q;
assign word_counter_o = word_counter_q;

always @(*) begin
	if (chip_mode_i == 2'b10) begin
		word_counter_d = word_counter_q + 4'b0010;
	end else begin
		word_counter_d = word_counter_q + 4'b0001;
	end
end

always @(posedge clk_i) begin
	word_counter_q <= word_counter_d;
end

endmodule