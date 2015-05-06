module receiver (
	input clk_i,
	input new_data_i,
	input [7:0] data_i,
	input timed_out_i,
	input nonce_register_ready_i,

	output reg timeout_counter_reset_o,
	output reg start_o,
	output reg stop_o,
	output reg ping_o,
	output reg nonce_o
);

reg [1:0] state, nextstate;

localparam	FIRST_HEADER	= 0,
			SECOND_HEADER	= 1,
			COMMAND			= 2,
			NONCE_WAIT		= 3;

always @(*) begin
	timeout_counter_reset_o = 1'b0;
	start_o = 1'b0;
	stop_o = 1'b0;
	ping_o = 1'b0;
	nonce_o = 1'b0;

	case(state)
		FIRST_HEADER:
		if (new_data_i) begin
			if (data_i == 8'd100) begin //'d' = 100
				timeout_counter_reset_o = 1'b1;
				nextstate = SECOND_HEADER;
			end else begin
				nextstate = FIRST_HEADER;
			end
		end else begin
			nextstate = FIRST_HEADER;
		end

		SECOND_HEADER:
		if (timed_out_i) begin
			nextstate = FIRST_HEADER;
		end else begin
			if (new_data_i) begin
				if (data_i == 8'd52) begin //'4' = 52
					timeout_counter_reset_o = 1'b1;
					nextstate = COMMAND;
				end else if (data_i == 8'd100) begin //'d' = 100
					timeout_counter_reset_o = 1'b1;
					nextstate = SECOND_HEADER;
				end else begin
					nextstate = FIRST_HEADER;
				end
			end else begin
				nextstate = SECOND_HEADER;
			end
		end

		COMMAND:
		if (timed_out_i) begin
			nextstate = FIRST_HEADER;
		end else begin
			if (new_data_i) begin
				if (data_i == 8'd110) begin //'n' = 110
					nonce_o = 1'b1;
					nextstate = NONCE_WAIT;
				end else if (data_i == 8'd48) begin //'0' = 48
					stop_o = 1'b1;
					nextstate = FIRST_HEADER;
				end else if (data_i == 8'd49) begin //'1' = 49
					start_o = 1'b1;
					nextstate = FIRST_HEADER;
				end else if (data_i == 8'd112) begin //'p' = 112
					ping_o = 1'b1;
					nextstate = FIRST_HEADER;
				end else begin
					nextstate = FIRST_HEADER;
				end
			end else begin
				nextstate = COMMAND;
			end
		end

		NONCE_WAIT:
		if (nonce_register_ready_i) begin
			nextstate = FIRST_HEADER;
		end else begin
			nextstate = NONCE_WAIT;
		end
	endcase
end

always @(posedge clk_i)
	state <= nextstate;
	
endmodule
