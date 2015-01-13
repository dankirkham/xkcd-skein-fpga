module permute_logic_y1 (
	input [3:0] word_i,
	output [15:0] word_select_o
	);

reg [15:0] word_select;
assign word_select_o = word_select;

always @(*) begin
	case (word_i)
		0 : word_select =  16'b0000001000000000; // 9
		2 : word_select =  16'b0010000000000000; // 13
		4 : word_select =  16'b0000100000000000; // 11
		6 : word_select =  16'b1000000000000000; // 15
		8 : word_select =  16'b0000000010000000; // 7
		10 : word_select = 16'b0000000000001000; // 3
		12 : word_select = 16'b0000000000100000; // 5
		14 : word_select = 16'b0000000000000010; // 1
	endcase
end
	
endmodule