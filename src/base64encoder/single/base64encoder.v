module base64encoder (
	input [5:0] input_i,

	output reg [7:0] output_o
);

always @(*) begin
  case(input_i)
    6'd0: output_o = "A";
    6'd1: output_o = "B";
    6'd2: output_o = "C";
    6'd3: output_o = "D";
    6'd4: output_o = "E";
    6'd5: output_o = "F";
    6'd6: output_o = "G";
    6'd7: output_o = "H";
    6'd8: output_o = "I";
    6'd9: output_o = "J";
    6'd10: output_o = "K";
    6'd11: output_o = "L";
    6'd12: output_o = "M";
    6'd13: output_o = "N";
    6'd14: output_o = "O";
    6'd15: output_o = "P";
    6'd16: output_o = "Q";
    6'd17: output_o = "R";
    6'd18: output_o = "S";
    6'd19: output_o = "T";
    6'd20: output_o = "U";
    6'd21: output_o = "V";
    6'd22: output_o = "W";
    6'd23: output_o = "X";
    6'd24: output_o = "Y";
    6'd25: output_o = "Z";
    6'd26: output_o = "a";
    6'd27: output_o = "b";
    6'd28: output_o = "c";
    6'd29: output_o = "d";
    6'd30: output_o = "e";
    6'd31: output_o = "f";
    6'd32: output_o = "g";
    6'd33: output_o = "h";
    6'd34: output_o = "i";
    6'd35: output_o = "j";
    6'd36: output_o = "k";
    6'd37: output_o = "l";
    6'd38: output_o = "m";
    6'd39: output_o = "n";
    6'd40: output_o = "o";
    6'd41: output_o = "p";
    6'd42: output_o = "q";
    6'd43: output_o = "r";
    6'd44: output_o = "s";
    6'd45: output_o = "t";
    6'd46: output_o = "u";
    6'd47: output_o = "v";
    6'd48: output_o = "w";
    6'd49: output_o = "x";
    6'd50: output_o = "y";
    6'd51: output_o = "z";
    6'd52: output_o = "0";
    6'd53: output_o = "1";
    6'd54: output_o = "2";
    6'd55: output_o = "3";
    6'd56: output_o = "4";
    6'd57: output_o = "5";
    6'd58: output_o = "6";
    6'd59: output_o = "7";
    6'd60: output_o = "8";
    6'd61: output_o = "9";
    6'd62: output_o = "+";
    6'd63: output_o = "/";
  endcase
end

endmodule
