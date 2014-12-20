module key_extender (
	input [1023:0] key_i,
	output [1087:0] key_o
    );
	 
reg [1087:0] key;

assign key_o = key;

always @(*) begin
	key[1087:1024] = 64'h1BD11BDAA9FC1A22 ^ key[1023:960] ^ key[959:896] ^ key[895:832] ^ key[831:768] ^ key[767:704] ^ key[703:640] ^ key[639:576] ^ key[575:512] ^ key[511:448] ^ key[447:384] ^ key[383:320] ^ key[319:256] ^ key[255:192] ^ key[191:128] ^ key[127:64] ^ key[63:0];
	key[1023:0] = key_i;
end

endmodule
