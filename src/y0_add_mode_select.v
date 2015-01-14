module y0_add_mode_select (
	input mode_i,
	input [15:0] y0_i,
	input [15:0] add_i,
	output [15:0] selected_o
);

reg [15:0] selected;
assign selected_o = selected;

always @(*) begin
	if (mode_i) begin // y0 mode
		selected = y0_i;
	end else begin // add mode
		selected = add_i;
	end
end

endmodule