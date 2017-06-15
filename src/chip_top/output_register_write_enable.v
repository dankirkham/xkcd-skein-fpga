module output_register_write_enable (
	input [15:0] write_bits_i,
	input write_enable_i,
	output reg [15:0] write_bits_o
);

always @(*) begin
	if (write_enable_i == 1'b1)
		write_bits_o = write_bits_i;
	else
		write_bits_o = 16'd0;
end

endmodule