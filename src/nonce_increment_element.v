module nonce_increment_element (
	input [7:0] byte_i,
	input carry_i,
	output [7:0] byte_o,
	output carry_o
);

reg [6:0] sum;

assign byte_o = {1'b1, sum[5:0], 1'b0};
assign carry_o = sum[6];

always @(*) begin
	sum[6:0] = byte_i[6:1] + 1;
end

endmodule
