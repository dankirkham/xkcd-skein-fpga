module plaintext_select (
	input mode_i,
	input [255:0] nonce_i,
	input [31:0] core_i,
	
	output [1023:0] plaintext_o
    );

reg [1023:0] plaintext;

assign plaintext_o = plaintext;

always @(*) begin
	if (mode_i) // Zeros
	begin
		plaintext[1023:0] = 64'b0;
	end else begin // Nonce mode
		plaintext[1023:512] = 512'b0; // Zero pad
		plaintext[511:256] = nonce_i; // Nonce
		plaintext[255:248] = 8'h5F; // _
		plaintext[247:216] = core_i; // Core
		plaintext[215:192] = 24'h5F6D6F; // om_
		plaintext[191:128] = 64'h632e6c69616d6740; // @gmail.c
		plaintext[127:64] = 64'h6d61686b72694b2e; // .Kirkham
		plaintext[63:0] = 64'h412e6c65696e6144; // Daniel.A
	end
end

endmodule
