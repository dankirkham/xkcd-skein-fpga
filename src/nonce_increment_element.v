module nonce_increment_element (
	input [7:0] byte_i,
	input carry_i,
	output [7:0] byte_o,
	output carry_o
);

reg [5:0] sum;

assign byte_o = {2'b01, sum[4:0], 1'b0};
assign carry_o = sum[5];

always @(*) begin
	sum[5:0] = byte_i[4:1] + 1;
end

endmodule
