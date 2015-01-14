module chip_mode_register (
	input clk_i,
	input [3:0] word_counter_i,
	input [6:0] round_counter_i,
	output [1:0] chip_mode_o
);

reg [1:0] chip_mode_d, chip_mode_q;
assign chip_mode_o = chip_mode_q;

always @(*) begin
	if ((word_counter_i == 4'd15) && (chip_mode_q[1] = 1'b0)) begin // if in subkey generate or subkey add mode
		chip_mode_d = chip_mode_q + 1'b1;
	else if ((word_counter_i == 4'd14) && (chip_mode_q = 2'b10)) begin // if in threefish mode
		if ((round_counter_i + 1'b1) % 4 == 1'b0) begin // is it time to add another subkey
			chip_mode_d = 2'b00; // goto subkey gen mode
		end else begin
			chip_mode_d = 2'b10; // goto subkey threefish mode
		end
	end else begin
		chip_mode_d = chip_mode_q;
	end
end

always @(posedge clk_i) begin
	chip_mode_q <= chip_mode_d;
end

endmodule