module tweak_word_select (
	input [1:0] select_i,
	input [191:0] tweak_i,
	output [63:0] tweak_word_o
    );
	 
reg [63:0] tweak_word;

assign tweak_word_o = tweak_word;

always @(*) begin
	if (select_i == 2'd0) begin
		tweak_word[63:0] = tweak_i[63:0];
	end else if (select_i == 2'd1) begin
		tweak_word[63:0] = tweak_i[127:64];
	end else begin
		tweak_word[63:0] = tweak_i[191:128];
	end
end

endmodule