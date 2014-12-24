module output_write_demux (
	input [3:0] select_i,
	input write_i,
	output write_0_o,
	output write_1_o,
	output write_2_o,
	output write_3_o,
	output write_4_o,
	output write_5_o,
	output write_6_o,
	output write_7_o,
	output write_8_o,
	output write_9_o,
	output write_10_o,
	output write_11_o,
	output write_12_o,
	output write_13_o,
	output write_14_o,
	output write_15_o
);

always @(*) begin
	if (select_i == 4'd0) begin
		write_0 = 1'b1;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd1) begin
		write_0 = 1'b0;
		write_1 = 1'b1;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd2) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b1;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd3) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b1;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd4) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b1;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd5) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b1;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd6) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b1;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd7) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b1;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd8) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b1;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd9) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b1;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd10) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b1;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd11) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b1;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd12) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b1;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd13) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b1;
		write_14 = 1'b0;
		write_15 = 1'b0;
	end else if (select_i == 4'd14) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b1;
		write_15 = 1'b0;
	end else if (select_i == 4'd15) begin
		write_0 = 1'b0;
		write_1 = 1'b0;
		write_2 = 1'b0;
		write_3 = 1'b0;
		write_4 = 1'b0;
		write_5 = 1'b0;
		write_6 = 1'b0;
		write_7 = 1'b0;
		write_8 = 1'b0;
		write_9 = 1'b0;
		write_10 = 1'b0;
		write_11 = 1'b0;
		write_12 = 1'b0;
		write_13 = 1'b0;
		write_14 = 1'b0;
		write_15 = 1'b1;
	end
end

endmodule