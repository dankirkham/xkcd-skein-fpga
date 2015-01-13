module output_register_plaintext_select (
	input mode_i,
	input [1023:0] output_register_i,
	input [1023:0] plaintext_i,
	
	output [1023:0] state_o
    );

reg [1023:0] state;

assign state_o = state;

always @(*) begin
	if (mode_i) // Initial plaintext mode
	begin
		state[1023:0] = plaintext_i[1023:0];
	end else begin // Previous state mode
		state[1023:0] = output_register_i[1023:0];
	end
end

endmodule
