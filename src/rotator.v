module rotator (
	input [63:0] word_i,
	input [5:0] rotate_bits_i,
	
	output [63:0] rotated_word_o
    );
	 
reg [63:0] rotated_word;
	 
assign rotated_word_o = rotated_word;

always @(*) begin
	rotated_word = (word_i << rotate_bits_i) | (word_i >> (7'd64 - rotate_bits_i));
end

endmodule