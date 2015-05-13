(* LUT_MAP="yes" *)
module hash_bits_off_lut_stage2 (
	input [5:0] six_bits_i,
	output reg [3:0] four_bits_o
);

always @(*) begin
	case (six_bits_i)
		6'd000000: four_bits_o = 4'd0;
		6'd000001: four_bits_o = 4'd1;
		6'd000010: four_bits_o = 4'd2;
		6'd000011: four_bits_o = 4'd3;
		6'd000100: four_bits_o = 4'd4;
		6'd001001: four_bits_o = 4'd2;
		6'd001000: four_bits_o = 4'd1;
		6'd001010: four_bits_o = 4'd3;
		6'd001011: four_bits_o = 4'd4;
		6'd001100: four_bits_o = 4'd5;
		6'd010000: four_bits_o = 4'd2;
		6'd010001: four_bits_o = 4'd3;
		6'd010010: four_bits_o = 4'd4;
		6'd010011: four_bits_o = 4'd5;
		6'd010100: four_bits_o = 4'd6;
		6'd011000: four_bits_o = 4'd3;
		6'd011001: four_bits_o = 4'd4;
		6'd011010: four_bits_o = 4'd5;
		6'd011011: four_bits_o = 4'd6;
		6'd011100: four_bits_o = 4'd7;
		6'd100000: four_bits_o = 4'd4;
		6'd100001: four_bits_o = 4'd5;
		6'd100010: four_bits_o = 4'd6;
		6'd100011: four_bits_o = 4'd7;
		default: four_bits_o = 4'd8;
	endcase
end

endmodule
