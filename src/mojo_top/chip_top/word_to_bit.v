module word_to_bit (
	input [3:0] word_i,
	output [15:0] bits_o
);

reg [15:0] bits;
assign bits_o = bits;

always @(*) begin
	case (word_i)
		0: bits =  16'b0000000000000001;
		1: bits =  16'b0000000000000010;
		2: bits =  16'b0000000000000100;
		3: bits =  16'b0000000000001000;
		4: bits =  16'b0000000000010000;
		5: bits =  16'b0000000000100000;
		6: bits =  16'b0000000001000000;
		7: bits =  16'b0000000010000000;
		8: bits =  16'b0000000100000000;
		9: bits =  16'b0000001000000000;
		10: bits = 16'b0000010000000000;
		11: bits = 16'b0000100000000000;
		12: bits = 16'b0001000000000000;
		13: bits = 16'b0010000000000000;
		14: bits = 16'b0100000000000000;
		15: bits = 16'b1000000000000000;
	endcase
end

endmodule