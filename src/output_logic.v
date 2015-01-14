module output_logic (
	input [3:0] word_i,
	output [15:0] word_select_o
	);

reg [15:0] word_select;
assign word_select_o = word_select;

always @(*) begin
	case (word_i)
		0 : word_select =  16'b0000000000000001;
		1 : word_select =  16'b0000000000000010;
		2 : word_select =  16'b0000000000000100;
		3 : word_select =  16'b0000000000001000;
		4 : word_select =  16'b0000000000010000;
		5 : word_select =  16'b0000000000100000;
		6 : word_select =  16'b0000000001000000;
		7 : word_select =  16'b0000000010000000;
		8 : word_select =  16'b0000000100000000;
		9 : word_select =  16'b0000001000000000;
		10 : word_select = 16'b0000010000000000;
		11 : word_select = 16'b0000100000000000;
		12 : word_select = 16'b0001000000000000;
		13 : word_select = 16'b0010000000000000;
		14 : word_select = 16'b0100000000000000;
		15 : word_select = 16'b1000000000000000;
	endcase
end
	
endmodule