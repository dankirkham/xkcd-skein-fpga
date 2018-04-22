module base64encoder_x6 (
	input [47:0] input_i,

	output reg [63:0] output_o
);

base64encoder base64encoder0 (
  .input_i(input_i[5:0]),
  .output_o(output_o[7:0])
);

base64encoder base64encoder1 (
  .input_i(input_i[11:6]),
  .output_o(output_o[15:8])
);

base64encoder base64encoder2 (
  .input_i(input_i[17:12]),
  .output_o(output_o[23:16])
);

base64encoder base64encoder3 (
  .input_i(input_i[23:18]),
  .output_o(output_o[31:24])
);

base64encoder base64encoder4 (
  .input_i(input_i[29:24]),
  .output_o(output_o[39:32])
);

base64encoder base64encoder5 (
  .input_i(input_i[35:30]),
  .output_o(output_o[47:40])
);

base64encoder base64encoder6 (
  .input_i(input_i[41:36]),
  .output_o(output_o[55:48])
);

base64encoder base64encoder7 (
  .input_i(input_i[47:42]),
  .output_o(output_o[63:56])
);

endmodule
