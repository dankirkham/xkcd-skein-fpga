module nonce_register_control (
	input clk_i,
	input receive_new_nonce_i,
	input timed_out_i,
	input byte_counter_zero_i,
	input rx_new_i,
	output reg nonce_register_ready_o,
	output reg byte_counter_reset_o,
	output reg nonce_register_shift_in_byte_decrement_byte_and_reset_timeout_o
);

reg state, nextstate;
localparam	READY = 0,
			NONCE_RECEIVE = 1;

always @(*) begin
	nonce_register_ready_o = 1'b0;
	byte_counter_reset_o = 1'b0;
	nonce_register_shift_in_byte_decrement_byte_and_reset_timeout_o = 1'b0;
	
	case (state)
		READY:
		begin
			nonce_register_ready_o = 1'b1;
			if (receive_new_nonce_i) begin
				nextstate = NONCE_RECEIVE;
				byte_counter_reset_o = 1'b1;
			end else begin
				nextstate = READY;
			end
		end
		
		NONCE_RECEIVE:
		begin
			nonce_register_ready_o = 1'b0;
			if (timed_out_i) begin
				nextstate = READY;
			end else begin
				if (rx_new_i) begin
					nonce_register_shift_in_byte_decrement_byte_and_reset_timeout_o = 1'b1;
					if (byte_counter_zero_i)
						nextstate = READY;
					else
						nextstate = NONCE_RECEIVE;
				end else begin
					nextstate = NONCE_RECEIVE;
				end
			end
		end
	endcase		
end

always @(posedge clk_i) begin
	state <= nextstate;
end

endmodule