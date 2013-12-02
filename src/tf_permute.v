module tf_permute (
		   input [1023:0] in,
		   output [1023:0] out_o
		   );
	
	reg [1023:0] out;
	wire out_o = out;
			
   always @(*) begin
      out[63:0] = in[63:0];
      out[127:64] = in[639:576];
      out[191:128] = in[191:128];
      out[255:192] = in[895:832];
      out[319:256] = in[447:384];
      out[383:320] = in[767:704];
      out[447:384] = in[319:256];
      out[511:448] = in[1023:960];
      out[575:512] = in[703:640];
      out[639:576] = in[511:448];
      out[703:640] = in[831:768];
      out[767:704] = in[255:192];
      out[831:768] = in[959:896];
      out[895:832] = in[383:320];
      out[959:896] = in[575:512];
      out[1023:960] = in[127:64];
   end
endmodule
