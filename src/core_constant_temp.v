module core_constant_temp (
	output [31:0] core_o
    );

reg [31:0] core;

assign core_o = core;

always @(*) begin
	core[31:0] = 32'b0;
end

endmodule
