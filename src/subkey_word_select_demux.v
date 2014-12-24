module subkey_word_select_demux (
	input [3:0] select_i,
	input control_i,
	output control_13_o,
	output control_14_o,
	output control_15_o,
    );
	 
reg control_13;
reg control_14;
reg control_15;

assign control_13_o = control_13;
assign control_14_o = control_14;
assign control_15_o = control_15;

always @(*) begin
	if (select_i == 4'd13) begin
		control_13 = 1'b1;
		control_14 = 1'b0;
		control_15 = 1'b0;
	end else if (select_i == 4'd14) begin
		control_13 = 1'b0;
		control_14 = 1'b1;
		control_15 = 1'b0;
	end else if (select_i == 4'd15) begin
		control_13 = 1'b0;
		control_14 = 1'b0;
		control_15 = 1'b1;
	end else begin
		control_13 = 1'b0;
		control_14 = 1'b0;
		control_15 = 1'b0;
	end
end

endmodule