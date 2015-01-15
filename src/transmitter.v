`timescale 1ns / 1ps

module transmitter(
	input clk_i,
	input rst_i,
	
	output [7:0] tx_data_o,
	output tx_new_o,
	input tx_busy_i,
	
	input [63:0] word_i,
	input ready_i
    );

localparam STATE_SIZE = 4;

localparam  IDLE = 0,
				WORD = 1,
				DONE = 9;

reg [STATE_SIZE-1:0] state_d, state_q;
reg [7:0] tx_data_d, tx_data_q;
reg tx_new_d, tx_new_q;
reg debug_d, debug_q;
reg wait_d, wait_q;

assign tx_data_o = tx_data_q;
assign tx_new_o = tx_new_q;

always @(*) begin
	state_d = state_q;
	tx_data_d = tx_data_q;
	tx_new_d = 1'b0;
	debug_d = debug_q;
	
	if (~tx_busy_i) begin
		case (state_q)
				IDLE: begin
					if (ready_i) begin
						state_d = WORD;
						debug_d = 1'b1;
					end
				end
				WORD: begin
					tx_data_d = word_i[7:0];
					tx_new_d = 1'b1;
					state_d = 4'd2;
					wait_d = 1'b1;
				end
				2: begin
					if (wait_q) begin
						wait_d = 1'b0;
					end else begin
						tx_data_d = word_i[15:8];
						tx_new_d = 1'b1;
						state_d = 4'd3;
						wait_d = 1'b1;
					end
				end
				3: begin
					if (wait_q) begin
						wait_d = 1'b0;
					end else begin
						tx_data_d = word_i[23:16];
						tx_new_d = 1'b1;
						state_d = 4'd4;
						wait_d = 1'b1;
					end
				end
				4: begin
					if (wait_q) begin
						wait_d = 1'b0;
					end else begin
						tx_data_d = word_i[31:24];
						tx_new_d = 1'b1;
						state_d = 4'd5;
						wait_d = 1'b1;
					end
				end
				5: begin
					if (wait_q) begin
						wait_d = 1'b0;
					end else begin
						tx_data_d = word_i[39:32];
						tx_new_d = 1'b1;
						state_d = 4'd6;
						wait_d = 1'b1;
					end
				end
				6: begin
					if (wait_q) begin
						wait_d = 1'b0;
					end else begin
						tx_data_d = word_i[47:40];
						tx_new_d = 1'b1;
						state_d = 4'd7;
						wait_d = 1'b1;
					end
				end
				7: begin
					if (wait_q) begin
						wait_d = 1'b0;
					end else begin
						tx_data_d = word_i[55:48];
						tx_new_d = 1'b1;
						state_d = 4'd8;
						wait_d = 1'b1;
					end
				end
				8: begin
					if (wait_q) begin
						wait_d = 1'b0;
					end else begin
						tx_data_d = word_i[63:56];
						tx_new_d = 1'b1;
						state_d = DONE;
						wait_d = 1'b1;
					end
				end
		endcase
	end
end

always @(posedge clk_i) begin
	state_q <= state_d;
	tx_data_q <= tx_data_d;
	tx_new_q <= tx_new_d;
	debug_q <= debug_d;
	wait_q <= wait_d;
	
	if (rst_i) begin
		state_q <= IDLE;
		debug_q <= 1'b0;
		wait_q <= 1'b0;
	end
end

endmodule
