module tweak_add_type_select_logic (
	input [4:0] word_i,
	output [1:0] tweak_add_type_o
);

reg [1:0] tweak_add_type;
assign tweak_add_type_o = tweak_add_type;

always @(*) begin
	case (word_i)
		13: tweak_add_type = 2'b00;
		14: tweak_add_type = 2'b01;
		default: tweak_add_type = 2'b10;
	endcase
end

endmodule