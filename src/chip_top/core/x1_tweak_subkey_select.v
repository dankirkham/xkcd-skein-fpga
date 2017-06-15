module x1_tweak_subkey_select (
	input [1:0] mode_i,
	input [63:0] x1_i,
	input [63:0] tweak_i,
	input [63:0] subkey_i,
	output [63:0] selected_o
	);

reg [63:0] selected;
assign selected_o = selected;

always @(*) begin
	case (mode_i)
		0: selected = x1_i;
		1: selected = tweak_i;
		default: selected = subkey_i;
	endcase
end

endmodule