module nonce_temp (
	output [255:0] nonce_o
    );

reg [255:0] nonce;

assign nonce_o = nonce;

always @(*) begin
	nonce[255:0] = 256'b0;
end

endmodule
