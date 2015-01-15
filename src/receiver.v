`timescale 1ns / 1ps

module receiver(
	input clk,
	input rst,
	input [7:0] rx_data,
	input rx_new,
	output [63:0] word1,
	output [63:0] word2,
	output ready
    );

localparam STATE_SIZE = 5;

localparam  HEADER = 0,
				FIRST_WORD = 1,
				SECOND_WORD = 9,
				FOOTER = 17,
				READY = 18;

reg [STATE_SIZE-1:0] state_d, state_q;
reg [63:0] first_d, first_q;
reg [63:0] second_d, second_q;
reg ready_d, ready_q;

assign word1 = first_q;
assign word2 = second_q;
assign ready = ready_q;

always @(*) begin
	state_d = state_q;
	first_d = first_q;
	second_d = second_q;
	ready_d = ready_q;
	
	if (state_q == READY) begin
		ready_d = 1'b1;
	end else begin
		ready_d = 1'b0;
	end
	
	if (rx_new) begin
		case (state_q)
			HEADER: begin
				if (rx_data == 8'd42) begin
					state_d = FIRST_WORD;
				end
			end
			READY: begin
				if (rx_data == 8'd42) begin
					state_d = FIRST_WORD;
				end
			end
			FIRST_WORD: begin
				first_d[7:0] = rx_data;
				state_d = 2;
			end
			2: begin
				first_d[15:8] = rx_data;
				state_d = 3;
			end
			3: begin
				first_d[23:16] = rx_data;
				state_d = 4;
			end
			4: begin
				first_d[31:24] = rx_data;
				state_d = 5;
			end
			5: begin
				first_d[39:32] = rx_data;
				state_d = 6;
			end
			6: begin
				first_d[47:40] = rx_data;
				state_d = 7;
			end
			7: begin
				first_d[55:48] = rx_data;
				state_d = 8;
			end
			8: begin
				first_d[63:56] = rx_data;
				state_d = SECOND_WORD;
			end
			SECOND_WORD: begin
				second_d[7:0] = rx_data;
				state_d = 10;
			end
			10: begin
				second_d[15:8] = rx_data;
				state_d = 11;
			end
			11: begin
				second_d[23:16] = rx_data;
				state_d = 12;
			end
			12: begin
				second_d[31:24] = rx_data;
				state_d = 13;
			end
			13: begin
				second_d[39:32] = rx_data;
				state_d = 14;
			end
			14: begin
				second_d[47:40] = rx_data;
				state_d = 15;
			end
			15: begin
				second_d[55:48] = rx_data;
				state_d = 16;
			end
			16: begin
				second_d[63:56] = rx_data;
				state_d = FOOTER;
			end
			FOOTER: begin
				if (rx_data == 8'd42) begin
					state_d = READY;
				end else begin
					state_d = HEADER; // Malformed packet, reset to start
				end
			end
		endcase
	end
end

always @(posedge clk) begin
	state_q <= state_d;
	first_q <= first_d;
	second_q <= second_d;
	ready_q <= ready_d;
	
	if (rst) begin
		state_q <= HEADER;
		first_q <= 64'b0;
		second_q <= 64'b0;
	end
end

endmodule
