module nonce_increment_element (
	input [7:0] byte_i,
	input carry_i,
	output reg [7:0] byte_o,
	output reg carry_o
);

always @(*) begin // 33 to 127
	if ((byte_i + carry_i) < 8'd127) begin
		byte_o = byte_i + carry_i;
		carry_o = 1'b0;
	end else begin
		byte_o = byte_i + carry_i - 8'd94;
		carry_o = 1'b1;
	end
end

endmodule