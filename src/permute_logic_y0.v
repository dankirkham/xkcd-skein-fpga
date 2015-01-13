module permute_logic_y0 (
	input [3:0] word_i,
	output [15:0] word_select_o
	);

reg [15:0] word_select;
assign word_select_o = word_select;

always @(*) begin
	case (word_i)
		0 : word_select =  16'b0000000000000001; // 0
		2 : word_select =  16'b0000000000000100; // 2
		4 : word_select =  16'b0000000001000000; // 6
		6 : word_select =  16'b0000000000010000; // 4
		8 : word_select =  16'b0000010000000000; // 10
		10 : word_select = 16'b0001000000000000; // 12
		12 : word_select = 16'b0100000000000000; // 14
		14 : word_select = 16'b0000000100000000; // 8
	endcase
end
	
endmodule