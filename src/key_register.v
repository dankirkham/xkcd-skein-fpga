module key_register (
	input clk_i,
	input rst_i,
	input ready_i,
	input [63:0] word_i,
	
	output [1023:0] key_o
    );

localparam STATE_SIZE = 4;
localparam IDLE = 0;

reg [STATE_SIZE-1:0] state_d, state_q;
reg [1023:0] key_d, key_q;

assign key_o = key_q;

always @(*) begin
	case (state_q)
		IDLE: begin
			if (ready_i) begin
				key_d[63:0] = word_i;
				state_d = 4'd1;
			end else begin
				state_d = 4'd0;
			end
		end
		1: begin
			key_d[127:64] = word_i;
			state_d = state_q + 1'b1;
		end
		2: begin
			key_d[191:128] = word_i;
			state_d = state_q + 1'b1;
		end
		3: begin
			key_d[255:192] = word_i;
			state_d = state_q + 1'b1;
		end
		4: begin
			key_d[319:256] = word_i;
			state_d = state_q + 1'b1;
		end
		5: begin
			key_d[383:320] = word_i;
			state_d = state_q + 1'b1;
		end
		6: begin
			key_d[447:384] = word_i;
			state_d = state_q + 1'b1;
		end
		7: begin
			key_d[511:448] = word_i;
			state_d = state_q + 1'b1;
		end
		8: begin
			key_d[575:512] = word_i;
			state_d = state_q + 1'b1;
		end
		9: begin
			key_d[639:576] = word_i;
			state_d = state_q + 1'b1;
		end
		10: begin
			key_d[703:640] = word_i;
			state_d = state_q + 1'b1;
		end
		11: begin
			key_d[767:704] = word_i;
			state_d = state_q + 1'b1;
		end
		12: begin
			key_d[831:768] = word_i;
			state_d = state_q + 1'b1;
		end
		13: begin
			key_d[895:832] = word_i;
			state_d = state_q + 1'b1;
		end
		14: begin
			key_d[959:896] = word_i;
			state_d = state_q + 1'b1;
		end
		15: begin
			key_d[1023:960] = word_i;
			state_d = IDLE;
		end
end

always @(posedge clk) begin
	state_q <= state_d;
	key_q <= key_d;
	
	if (rst_i) begin
		state_q <= IDLE;
		key_q <= 1024'd0;
	end
end

endmodule
