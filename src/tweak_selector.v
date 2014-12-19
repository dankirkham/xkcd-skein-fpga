`timescale 1ns / 1ps
module tweak_selector (
	input mode_i,
	output [191:0] tweak_o
    );
	 
reg [191:0] tweak;

assign tweak_o = tweak;

always @(*) begin
	if (mode_i == 1'b0) // Message Mode (Skein Whitepaper 3.5.1)
	begin
		tweak[63:0] = 64'd64;
		tweak[127:64] = 64'hF000000000000000;
		tweak[191:128] = 64'hF00000000000040; // XOR of last two words
	end
	else
	begin
		tweak[63:0] = 64'd8;
		tweak[127:64] = 64'hFF00000000000000;
		tweak[191:128] = 64'hFF0000000000008; // XOR of last two words
	end
end

endmodule