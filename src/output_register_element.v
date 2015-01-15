module output_register_element (
	input clk_i,
	input write_i,
	input [63:0] state_i,
	
	output [63:0] state_o
	);
	
reg [63:0] state_d, state_q;

assign state_o = state_q;

always @(*) begin
	if (write_i) begin
		state_d = state_i;
	end else begin
		state_d = state_q;
	end
end

always @(posedge clk_i) begin
	state_q <= state_d;
end

endmodule