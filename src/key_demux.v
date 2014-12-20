module key_demux (
	input [4:0] select_i,
	input [1087:0] key_i,
	output [63:0] key_word_o
    );
	 
reg [63:0] key_word;

assign key_word_o = key_word;

always @(*) begin
	case (select_i)
		0: key_word[63:0] = key_i[63:0];
		1: key_word[63:0] = key_i[127:64];
		2: key_word[63:0] = key_i[191:128];
		3: key_word[63:0] = key_i[255:192];
		4: key_word[63:0] = key_i[319:256];
		5: key_word[63:0] = key_i[383:320];
		6: key_word[63:0] = key_i[447:384];
		7: key_word[63:0] = key_i[511:448];
		8: key_word[63:0] = key_i[575:512];
		9: key_word[63:0] = key_i[639:576];
		10: key_word[63:0] = key_i[703:640];
		11: key_word[63:0] = key_i[767:704];
		12: key_word[63:0] = key_i[831:768];
		13: key_word[63:0] = key_i[895:832];
		14: key_word[63:0] = key_i[959:896];
		15: key_word[63:0] = key_i[1023:960];
		default: key_word[63:0] = key_i[1087:1024];
	end case
end

endmodule