module key_select (
	input mode_i,
	input [1023:0] key_register_i,
	input [1023:0] key_constant_i,
	
	output [1023:0] key_o
    );

reg [1023:0] key;

assign key_o = key;

always @(*) begin
	if (mode_i) // Output Mode
	begin
		key[1023:0] = key_register_i[1023:0];
	end else begin // Message Mode
		key[1023:0] = key_constant_i[1023:0];
	end
end

endmodule
