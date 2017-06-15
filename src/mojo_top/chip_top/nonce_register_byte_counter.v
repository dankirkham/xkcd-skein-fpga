module nonce_register_byte_counter (
	input clk_i,
	input reset_i,
	input decrement_i,
	output reg zero_o
);

reg [4:0] counter_d, counter_q;

always @(*) begin
	if (counter_q == 5'd0)
		zero_o = 1'b1;
	else
		zero_o = 1'b0;
		
	if (reset_i)
		counter_d = 5'd31;
	else if (decrement_i)
		counter_d = counter_q - 5'd1;
	else
		counter_d = counter_q;
end

always @(posedge clk_i) begin
	counter_q <= counter_d;
end

endmodule