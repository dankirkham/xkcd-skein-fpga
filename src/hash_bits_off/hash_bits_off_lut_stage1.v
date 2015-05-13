module hash_bits_off_lut_stage1 (
  input [3:0] four_bits_i,
  output reg [2:0] three_bits_o
  );

always @(*) begin
  case (four_bits_i)
    4'b0000: three_bits_o = 3'd0;
    4'b0001: three_bits_o = 3'd1;
    4'b0010: three_bits_o = 3'd1;
    4'b0011: three_bits_o = 3'd2;
    4'b0100: three_bits_o = 3'd1;
    4'b0101: three_bits_o = 3'd2;
    4'b0110: three_bits_o = 3'd2;
    4'b0111: three_bits_o = 3'd3;
    4'b1000: three_bits_o = 3'd1;
    4'b1001: three_bits_o = 3'd2;
    4'b1010: three_bits_o = 3'd2;
    4'b1011: three_bits_o = 3'd3;
    4'b1100: three_bits_o = 3'd2;
    4'b1101: three_bits_o = 3'd3;
    4'b1110: three_bits_o = 3'd3;
    default: three_bits_o = 3'd4;
  endcase
end

endmodule
