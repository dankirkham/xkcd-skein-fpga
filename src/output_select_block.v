module output_select_block (
	input [3:0] Y1_bits_i,
	input [63:0] Y0_i,
	input [63:0] Y1_i,
	
	output [1023:0] output_o
    );
	
reg [1023:0] output_w;
assign output_o = output_w;

output_select_element output_select_element0 (
	.select_i(Y1_bits_i[0]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[63:0])
);

output_select_element output_select_element1 (
	.select_i(Y1_bits_i[1]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[127:64])
);

output_select_element output_select_element2 (
	.select_i(Y1_bits_i[2]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[191:128])
);

output_select_element output_select_element3 (
	.select_i(Y1_bits_i[3]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[255:192])
);

output_select_element output_select_element4 (
	.select_i(Y1_bits_i[4]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[319:256])
);

output_select_element output_select_element5 (
	.select_i(Y1_bits_i[5]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[383:320])
);

output_select_element output_select_element6 (
	.select_i(Y1_bits_i[6]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[447:384])
);

output_select_element output_select_element7 (
	.select_i(Y1_bits_i[7]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[511:448])
);

output_select_element output_select_element8 (
	.select_i(Y1_bits_i[8]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[575:512])
);

output_select_element output_select_element9 (
	.select_i(Y1_bits_i[9]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[639:576])
);

output_select_element output_select_element10 (
	.select_i(Y1_bits_i[10]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[703:640])
);

output_select_element output_select_element11 (
	.select_i(Y1_bits_i[11]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[767:704])
);

output_select_element output_select_element12 (
	.select_i(Y1_bits_i[12]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[831:768])
);

output_select_element output_select_element13 (
	.select_i(Y1_bits_i[13]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[895:832])
);

output_select_element output_select_element14 (
	.select_i(Y1_bits_i[14]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[959:896])
);

output_select_element output_select_element15 (
	.select_i(Y1_bits_i[15]),
	.Y0_i(Y0_i),
	.Y1_i(Y1_i),
	.word_o(output_w[1023:960])
);


endmodule