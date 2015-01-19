module nonce_register (
	input clk_i,
	input increment_i,
	input shift_in_rx_data_i,
	input ready_i,
	input [255:0] incremented_nonce_i,
	input [7:0] rx_data_i,
	output [255:0] nonce_o
);

reg [255:0] nonce_d, nonce_q;
assign nonce_o = nonce_q;

always @(*) begin
	nonce_d = nonce_q;
	
	if (increment_i && ready_i)
		nonce_d = incremented_nonce_i;
	else if (shift_in_rx_data_i)
		//nonce_d = {nonce_q[247:0], rx_data_i[7:0]}; // MSB first
		nonce_d = {rx_data_i[7:0], nonce_q[255:8]}; // LSB first
end

always @(posedge clk_i) begin
	nonce_q <= nonce_d;
end

endmodule