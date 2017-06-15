module output_register_block (
	input clk_i,
	input [15:0] write_bits_i,
	input [1023:0] input_i,
	output [1023:0] output_o
	);
	
output_register_element output_register_element0 (
	.clk_i(clk_i),
	.write_i(write_bits_i[0]),
	.state_i(input_i[63:0]),
	.state_o(output_o[63:0])
);

output_register_element output_register_element1 (
	.clk_i(clk_i),
	.write_i(write_bits_i[1]),
	.state_i(input_i[127:64]),
	.state_o(output_o[127:64])
);

output_register_element output_register_element2 (
	.clk_i(clk_i),
	.write_i(write_bits_i[2]),
	.state_i(input_i[191:128]),
	.state_o(output_o[191:128])
);

output_register_element output_register_element3 (
	.clk_i(clk_i),
	.write_i(write_bits_i[3]),
	.state_i(input_i[255:192]),
	.state_o(output_o[255:192])
);

output_register_element output_register_element4 (
	.clk_i(clk_i),
	.write_i(write_bits_i[4]),
	.state_i(input_i[319:256]),
	.state_o(output_o[319:256])
);

output_register_element output_register_element5 (
	.clk_i(clk_i),
	.write_i(write_bits_i[5]),
	.state_i(input_i[383:320]),
	.state_o(output_o[383:320])
);

output_register_element output_register_element6 (
	.clk_i(clk_i),
	.write_i(write_bits_i[6]),
	.state_i(input_i[447:384]),
	.state_o(output_o[447:384])
);

output_register_element output_register_element7 (
	.clk_i(clk_i),
	.write_i(write_bits_i[7]),
	.state_i(input_i[511:448]),
	.state_o(output_o[511:448])
);

output_register_element output_register_element8 (
	.clk_i(clk_i),
	.write_i(write_bits_i[8]),
	.state_i(input_i[575:512]),
	.state_o(output_o[575:512])
);

output_register_element output_register_element9 (
	.clk_i(clk_i),
	.write_i(write_bits_i[9]),
	.state_i(input_i[639:576]),
	.state_o(output_o[639:576])
);

output_register_element output_register_element10 (
	.clk_i(clk_i),
	.write_i(write_bits_i[10]),
	.state_i(input_i[703:640]),
	.state_o(output_o[703:640])
);

output_register_element output_register_element11 (
	.clk_i(clk_i),
	.write_i(write_bits_i[11]),
	.state_i(input_i[767:704]),
	.state_o(output_o[767:704])
);

output_register_element output_register_element12 (
	.clk_i(clk_i),
	.write_i(write_bits_i[12]),
	.state_i(input_i[831:768]),
	.state_o(output_o[831:768])
);

output_register_element output_register_element13 (
	.clk_i(clk_i),
	.write_i(write_bits_i[13]),
	.state_i(input_i[895:832]),
	.state_o(output_o[895:832])
);

output_register_element output_register_element14 (
	.clk_i(clk_i),
	.write_i(write_bits_i[14]),
	.state_i(input_i[959:896]),
	.state_o(output_o[959:896])
);

output_register_element output_register_element15 (
	.clk_i(clk_i),
	.write_i(write_bits_i[15]),
	.state_i(input_i[1023:960]),
	.state_o(output_o[1023:960])
);
	
endmodule