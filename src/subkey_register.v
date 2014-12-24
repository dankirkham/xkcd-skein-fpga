module subkey_register (
	input clk_i,
	input rst_i,
	input write_i,
	input [63:0] word_i,
	
	output [63:0] subkey_o
    );

reg [63:0] subkey_d, subkey_q;

assign subkey_o = subkey_q;

always @(*) begin
	if (write_i) begin
		subkey_d = word_i;
	end else begin
		subkey_d = subkey_q;
	end
end

always @(posedge clk) begin
	subkey_q <= subkey_d;
	
	if (rst_i) begin
		subkey_q <= 64'd0;
	end
end

endmodule