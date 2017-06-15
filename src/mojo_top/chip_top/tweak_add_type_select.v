module tweak_add_type_select (
	input [1:0] type_i,
	input [4:0] subkey_select_i,
	input [63:0] tweak_word_i,
	output [63:0] tweak_add_word_o,
	output [1:0] tweak_word_select_o
    );
	 
reg [63:0] tweak_add_word;
reg [1:0] tweak_word_select;

assign tweak_add_word_o = tweak_add_word;
assign tweak_word_select_o = tweak_word_select;

always @(*) begin
	if (type_i == 2'd2) begin
		tweak_add_word[63:5] = 59'b0;
		tweak_add_word[4:0] = subkey_select_i;
	end else begin
		tweak_add_word[63:0] = tweak_word_i[63:0];
	end
	
	if (type_i == 2'd0) begin
		tweak_word_select = subkey_select_i % 3;
	end else begin
		tweak_word_select = (subkey_select_i + 1) % 3;
	end
end

endmodule