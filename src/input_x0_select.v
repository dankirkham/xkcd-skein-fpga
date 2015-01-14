modulde input_x0_select (
	input [1023:0] input_register_i,
	input [3:0] word_i,
	output [63:0] x0_o,
);

reg [63:0] x0;
assign x0_o = x0;

always @(*) begin
	case (word_i)
		0: x0 =  input_register_i[63:0];
		1: x0 =  input_register_i[127:64];
		2: x0 =  input_register_i[191:128];
		3: x0 =  input_register_i[255:192];
		4: x0 =  input_register_i[319:256];
		5: x0 =  input_register_i[383:320];
		6: x0 =  input_register_i[447:384];
		7: x0 =  input_register_i[511:448];
		8: x0 =  input_register_i[575:512];
		9: x0 =  input_register_i[639:576];
		10: x0 = input_register_i[703:640];
		11: x0 = input_register_i[767:704];
		12: x0 = input_register_i[831:768];
		13: x0 = input_register_i[895:832];
		14: x0 = input_register_i[959:896];
		15: x0 = input_register_i[1023:960];
	endcase
end

endmodule