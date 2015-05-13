module hash_bits_off_lut_stage3 (
	input [7:0] eight_bits_i,
	output reg [4:0] five_bits_o
);

always @(*) begin
	case (eight_bits_i)
		8'b00000000: five_bits_o = 5'd0;
		8'b00000001: five_bits_o = 5'd1;
		8'b00000010: five_bits_o = 5'd2;
		8'b00000011: five_bits_o = 5'd3;
		8'b00000100: five_bits_o = 5'd4;
		8'b00000101: five_bits_o = 5'd5;
		8'b00000110: five_bits_o = 5'd6;
		8'b00000111: five_bits_o = 5'd7;
		8'b00001000: five_bits_o = 5'd8;
		8'b00010000: five_bits_o = 5'd1;
		8'b00010001: five_bits_o = 5'd2;
		8'b00010010: five_bits_o = 5'd3;
		8'b00010011: five_bits_o = 5'd4;
		8'b00010100: five_bits_o = 5'd5;
		8'b00010101: five_bits_o = 5'd6;
		8'b00010110: five_bits_o = 5'd7;
		8'b00010111: five_bits_o = 5'd8;
		8'b00011000: five_bits_o = 5'd9;
		8'b00100000: five_bits_o = 5'd2;
		8'b00100001: five_bits_o = 5'd3;
		8'b00100010: five_bits_o = 5'd4;
		8'b00100011: five_bits_o = 5'd5;
		8'b00100100: five_bits_o = 5'd6;
		8'b00100101: five_bits_o = 5'd7;
		8'b00100110: five_bits_o = 5'd8;
		8'b00100111: five_bits_o = 5'd9;
		8'b00101000: five_bits_o = 5'd10;
		8'b00110000: five_bits_o = 5'd3;
		8'b00110001: five_bits_o = 5'd4;
		8'b00110010: five_bits_o = 5'd5;
		8'b00110011: five_bits_o = 5'd6;
		8'b00110100: five_bits_o = 5'd7;
		8'b00110101: five_bits_o = 5'd8;
		8'b00110110: five_bits_o = 5'd9;
		8'b00110111: five_bits_o = 5'd10;
		8'b00111000: five_bits_o = 5'd11;
		8'b01000000: five_bits_o = 5'd4;
		8'b01000001: five_bits_o = 5'd5;
		8'b01000010: five_bits_o = 5'd6;
		8'b01000011: five_bits_o = 5'd7;
		8'b01000100: five_bits_o = 5'd8;
		8'b01000101: five_bits_o = 5'd9;
		8'b01000110: five_bits_o = 5'd10;
		8'b01000111: five_bits_o = 5'd11;
		8'b01001000: five_bits_o = 5'd12;
		8'b01010000: five_bits_o = 5'd5;
		8'b01010001: five_bits_o = 5'd6;
		8'b01010010: five_bits_o = 5'd7;
		8'b01010011: five_bits_o = 5'd8;
		8'b01010100: five_bits_o = 5'd9;
		8'b01010101: five_bits_o = 5'd10;
		8'b01010110: five_bits_o = 5'd11;
		8'b01010111: five_bits_o = 5'd12;
		8'b01011000: five_bits_o = 5'd13;
		8'b01100000: five_bits_o = 5'd6;
		8'b01100001: five_bits_o = 5'd7;
		8'b01100010: five_bits_o = 5'd8;
		8'b01100011: five_bits_o = 5'd9;
		8'b01100100: five_bits_o = 5'd10;
		8'b01100101: five_bits_o = 5'd11;
		8'b01100110: five_bits_o = 5'd12;
		8'b01100111: five_bits_o = 5'd13;
		8'b01101000: five_bits_o = 5'd14;
		8'b01110000: five_bits_o = 5'd7;
		8'b01110001: five_bits_o = 5'd8;
		8'b01110010: five_bits_o = 5'd9;
		8'b01110011: five_bits_o = 5'd10;
		8'b01110100: five_bits_o = 5'd11;
		8'b01110101: five_bits_o = 5'd12;
		8'b01110110: five_bits_o = 5'd13;
		8'b01110111: five_bits_o = 5'd14;
		8'b01111000: five_bits_o = 5'd15;
		8'b10000000: five_bits_o = 5'd8;
		8'b10000001: five_bits_o = 5'd9;
		8'b10000010: five_bits_o = 5'd10;
		8'b10000011: five_bits_o = 5'd11;
		8'b10000100: five_bits_o = 5'd12;
		8'b10000101: five_bits_o = 5'd13;
		8'b10000110: five_bits_o = 5'd14;
		8'b10000111: five_bits_o = 5'd15;
		default: five_bits_o = 5'd16;
	endcase
end

endmodule
