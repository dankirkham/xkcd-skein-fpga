module x0_key_select (
	input mode_i,
	input [63:0] x0_i,
	input [63:0] key_i,
	output [63:0] selected_o
	);

reg [63:0] selected;
assign selected_o = selected;

always @(*) begin
	if (mode_i) begin // Key mode (subkey generate)
		selected = key_i;
	end else begin // x0 mode
		selected = x0_i;
	end
end

endmodule