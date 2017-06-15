module input_x1_select (
	input [1023:0] input_register_i,
	input [3:0] word_i,
	output [63:0] x1_o
);

reg [63:0] x1;
assign x1_o = x1;

always @(*) begin
	case (word_i)
		0: x1 =  input_register_i[127:64];
		2: x1 =  input_register_i[255:192];
		4: x1 =  input_register_i[383:320];
		6: x1 =  input_register_i[511:448];
		8: x1 =  input_register_i[639:576];
		10: x1 = input_register_i[767:704];
		12: x1 = input_register_i[895:832];
		default: x1 = input_register_i[1023:960];
	endcase
end

endmodule