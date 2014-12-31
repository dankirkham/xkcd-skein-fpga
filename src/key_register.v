module key_register (
	input clk_i,
	input write_i,
	input [1023:0] key_i,
	
	output [1023:0] key_o
    );

reg [1023:0] key_d, key_q;

assign key_o = key_q;

always @(*) begin
	if (write_i) begin
		key_d = key_i;
	end else begin
		key_d = key_q;
	end
end

always @(posedge clk) begin
	key_q <= key_d;
end

endmodule
