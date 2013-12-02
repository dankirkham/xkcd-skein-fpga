module tf_key_scheduler (
		      input 	      clk,
		      input 	      next,
		      input 	      reset,
		      input [1087:0]  key,
		      input [191:0]   tweak,
		      output [1023:0] subkey
		      );

   reg [4:0] 			      subkeyCounter;
   reg [1023:0] 		      subkey;

   always @(*) begin
      if (subkeyCounter == 0) begin
	 subkey[63:0] = key[63:0];
	 subkey[127:64] = key[127:64];
	 subkey[191:128] = key[191:128];
	 subkey[255:192] = key[255:192];
	 subkey[319:256] = key[319:256];
	 subkey[383:320] = key[383:320];
	 subkey[447:384] = key[447:384];
	 subkey[511:448] = key[511:448];
	 subkey[575:512] = key[575:512];
	 subkey[639:576] = key[639:576];
	 subkey[703:640] = key[703:640];
	 subkey[767:704] = key[767:704];
	 subkey[831:768] = key[831:768];
	 subkey[895:832] = key[895:832] + tweak[63:0];
	 subkey[959:896] = key[959:896] + tweak[127:64];
	 subkey[1023:960] = key[1023:960] + 0;
      end else if (subkeyCounter == 1) begin
	 subkey[63:0] = key[127:64];
	 subkey[127:64] = key[191:128];
	 subkey[191:128] = key[255:192];
	 subkey[255:192] = key[319:256];
	 subkey[319:256] = key[383:320];
	 subkey[383:320] = key[447:384];
	 subkey[447:384] = key[511:448];
	 subkey[511:448] = key[575:512];
	 subkey[575:512] = key[639:576];
	 subkey[639:576] = key[703:640];
	 subkey[703:640] = key[767:704];
	 subkey[767:704] = key[831:768];
	 subkey[831:768] = key[895:832];
	 subkey[895:832] = key[959:896] + tweak[127:64];
	 subkey[959:896] = key[1023:960] + tweak[191:128];
	 subkey[1023:960] = key[1087:1024] + 1;
      end else if (subkeyCounter == 2) begin
	 subkey[63:0] = key[191:128];
	 subkey[127:64] = key[255:192];
	 subkey[191:128] = key[319:256];
	 subkey[255:192] = key[383:320];
	 subkey[319:256] = key[447:384];
	 subkey[383:320] = key[511:448];
	 subkey[447:384] = key[575:512];
	 subkey[511:448] = key[639:576];
	 subkey[575:512] = key[703:640];
	 subkey[639:576] = key[767:704];
	 subkey[703:640] = key[831:768];
	 subkey[767:704] = key[895:832];
	 subkey[831:768] = key[959:896];
	 subkey[895:832] = key[1023:960] + tweak[191:128];
	 subkey[959:896] = key[1087:1024] + tweak[63:0];
	 subkey[1023:960] = key[63:0] + 2;
      end else if (subkeyCounter == 3) begin
	 subkey[63:0] = key[255:192];
	 subkey[127:64] = key[319:256];
	 subkey[191:128] = key[383:320];
	 subkey[255:192] = key[447:384];
	 subkey[319:256] = key[511:448];
	 subkey[383:320] = key[575:512];
	 subkey[447:384] = key[639:576];
	 subkey[511:448] = key[703:640];
	 subkey[575:512] = key[767:704];
	 subkey[639:576] = key[831:768];
	 subkey[703:640] = key[895:832];
	 subkey[767:704] = key[959:896];
	 subkey[831:768] = key[1023:960];
	 subkey[895:832] = key[1087:1024] + tweak[63:0];
	 subkey[959:896] = key[63:0] + tweak[127:64];
	 subkey[1023:960] = key[127:64] + 3;
      end else if (subkeyCounter == 4) begin
	 subkey[63:0] = key[319:256];
	 subkey[127:64] = key[383:320];
	 subkey[191:128] = key[447:384];
	 subkey[255:192] = key[511:448];
	 subkey[319:256] = key[575:512];
	 subkey[383:320] = key[639:576];
	 subkey[447:384] = key[703:640];
	 subkey[511:448] = key[767:704];
	 subkey[575:512] = key[831:768];
	 subkey[639:576] = key[895:832];
	 subkey[703:640] = key[959:896];
	 subkey[767:704] = key[1023:960];
	 subkey[831:768] = key[1087:1024];
	 subkey[895:832] = key[63:0] + tweak[127:64];
	 subkey[959:896] = key[127:64] + tweak[191:128];
	 subkey[1023:960] = key[191:128] + 4;
      end else if (subkeyCounter == 5) begin
	 subkey[63:0] = key[383:320];
	 subkey[127:64] = key[447:384];
	 subkey[191:128] = key[511:448];
	 subkey[255:192] = key[575:512];
	 subkey[319:256] = key[639:576];
	 subkey[383:320] = key[703:640];
	 subkey[447:384] = key[767:704];
	 subkey[511:448] = key[831:768];
	 subkey[575:512] = key[895:832];
	 subkey[639:576] = key[959:896];
	 subkey[703:640] = key[1023:960];
	 subkey[767:704] = key[1087:1024];
	 subkey[831:768] = key[63:0];
	 subkey[895:832] = key[127:64] + tweak[191:128];
	 subkey[959:896] = key[191:128] + tweak[63:0];
	 subkey[1023:960] = key[255:192] + 5;
      end else if (subkeyCounter == 6) begin
	 subkey[63:0] = key[447:384];
	 subkey[127:64] = key[511:448];
	 subkey[191:128] = key[575:512];
	 subkey[255:192] = key[639:576];
	 subkey[319:256] = key[703:640];
	 subkey[383:320] = key[767:704];
	 subkey[447:384] = key[831:768];
	 subkey[511:448] = key[895:832];
	 subkey[575:512] = key[959:896];
	 subkey[639:576] = key[1023:960];
	 subkey[703:640] = key[1087:1024];
	 subkey[767:704] = key[63:0];
	 subkey[831:768] = key[127:64];
	 subkey[895:832] = key[191:128] + tweak[63:0];
	 subkey[959:896] = key[255:192] + tweak[127:64];
	 subkey[1023:960] = key[319:256] + 6;
      end else if (subkeyCounter == 7) begin
	 subkey[63:0] = key[511:448];
	 subkey[127:64] = key[575:512];
	 subkey[191:128] = key[639:576];
	 subkey[255:192] = key[703:640];
	 subkey[319:256] = key[767:704];
	 subkey[383:320] = key[831:768];
	 subkey[447:384] = key[895:832];
	 subkey[511:448] = key[959:896];
	 subkey[575:512] = key[1023:960];
	 subkey[639:576] = key[1087:1024];
	 subkey[703:640] = key[63:0];
	 subkey[767:704] = key[127:64];
	 subkey[831:768] = key[191:128];
	 subkey[895:832] = key[255:192] + tweak[127:64];
	 subkey[959:896] = key[319:256] + tweak[191:128];
	 subkey[1023:960] = key[383:320] + 7;
      end else if (subkeyCounter == 8) begin
	 subkey[63:0] = key[575:512];
	 subkey[127:64] = key[639:576];
	 subkey[191:128] = key[703:640];
	 subkey[255:192] = key[767:704];
	 subkey[319:256] = key[831:768];
	 subkey[383:320] = key[895:832];
	 subkey[447:384] = key[959:896];
	 subkey[511:448] = key[1023:960];
	 subkey[575:512] = key[1087:1024];
	 subkey[639:576] = key[63:0];
	 subkey[703:640] = key[127:64];
	 subkey[767:704] = key[191:128];
	 subkey[831:768] = key[255:192];
	 subkey[895:832] = key[319:256] + tweak[191:128];
	 subkey[959:896] = key[383:320] + tweak[63:0];
	 subkey[1023:960] = key[447:384] + 8;
      end else if (subkeyCounter == 9) begin
	 subkey[63:0] = key[639:576];
	 subkey[127:64] = key[703:640];
	 subkey[191:128] = key[767:704];
	 subkey[255:192] = key[831:768];
	 subkey[319:256] = key[895:832];
	 subkey[383:320] = key[959:896];
	 subkey[447:384] = key[1023:960];
	 subkey[511:448] = key[1087:1024];
	 subkey[575:512] = key[63:0];
	 subkey[639:576] = key[127:64];
	 subkey[703:640] = key[191:128];
	 subkey[767:704] = key[255:192];
	 subkey[831:768] = key[319:256];
	 subkey[895:832] = key[383:320] + tweak[63:0];
	 subkey[959:896] = key[447:384] + tweak[127:64];
	 subkey[1023:960] = key[511:448] + 9;
      end else if (subkeyCounter == 10) begin
	 subkey[63:0] = key[703:640];
	 subkey[127:64] = key[767:704];
	 subkey[191:128] = key[831:768];
	 subkey[255:192] = key[895:832];
	 subkey[319:256] = key[959:896];
	 subkey[383:320] = key[1023:960];
	 subkey[447:384] = key[1087:1024];
	 subkey[511:448] = key[63:0];
	 subkey[575:512] = key[127:64];
	 subkey[639:576] = key[191:128];
	 subkey[703:640] = key[255:192];
	 subkey[767:704] = key[319:256];
	 subkey[831:768] = key[383:320];
	 subkey[895:832] = key[447:384] + tweak[127:64];
	 subkey[959:896] = key[511:448] + tweak[191:128];
	 subkey[1023:960] = key[575:512] + 10;
      end else if (subkeyCounter == 11) begin
	 subkey[63:0] = key[767:704];
	 subkey[127:64] = key[831:768];
	 subkey[191:128] = key[895:832];
	 subkey[255:192] = key[959:896];
	 subkey[319:256] = key[1023:960];
	 subkey[383:320] = key[1087:1024];
	 subkey[447:384] = key[63:0];
	 subkey[511:448] = key[127:64];
	 subkey[575:512] = key[191:128];
	 subkey[639:576] = key[255:192];
	 subkey[703:640] = key[319:256];
	 subkey[767:704] = key[383:320];
	 subkey[831:768] = key[447:384];
	 subkey[895:832] = key[511:448] + tweak[191:128];
	 subkey[959:896] = key[575:512] + tweak[63:0];
	 subkey[1023:960] = key[639:576] + 11;
      end else if (subkeyCounter == 12) begin
	 subkey[63:0] = key[831:768];
	 subkey[127:64] = key[895:832];
	 subkey[191:128] = key[959:896];
	 subkey[255:192] = key[1023:960];
	 subkey[319:256] = key[1087:1024];
	 subkey[383:320] = key[63:0];
	 subkey[447:384] = key[127:64];
	 subkey[511:448] = key[191:128];
	 subkey[575:512] = key[255:192];
	 subkey[639:576] = key[319:256];
	 subkey[703:640] = key[383:320];
	 subkey[767:704] = key[447:384];
	 subkey[831:768] = key[511:448];
	 subkey[895:832] = key[575:512] + tweak[63:0];
	 subkey[959:896] = key[639:576] + tweak[127:64];
	 subkey[1023:960] = key[703:640] + 12;
      end else if (subkeyCounter == 13) begin
	 subkey[63:0] = key[895:832];
	 subkey[127:64] = key[959:896];
	 subkey[191:128] = key[1023:960];
	 subkey[255:192] = key[1087:1024];
	 subkey[319:256] = key[63:0];
	 subkey[383:320] = key[127:64];
	 subkey[447:384] = key[191:128];
	 subkey[511:448] = key[255:192];
	 subkey[575:512] = key[319:256];
	 subkey[639:576] = key[383:320];
	 subkey[703:640] = key[447:384];
	 subkey[767:704] = key[511:448];
	 subkey[831:768] = key[575:512];
	 subkey[895:832] = key[639:576] + tweak[127:64];
	 subkey[959:896] = key[703:640] + tweak[191:128];
	 subkey[1023:960] = key[767:704] + 13;
      end else if (subkeyCounter == 14) begin
	 subkey[63:0] = key[959:896];
	 subkey[127:64] = key[1023:960];
	 subkey[191:128] = key[1087:1024];
	 subkey[255:192] = key[63:0];
	 subkey[319:256] = key[127:64];
	 subkey[383:320] = key[191:128];
	 subkey[447:384] = key[255:192];
	 subkey[511:448] = key[319:256];
	 subkey[575:512] = key[383:320];
	 subkey[639:576] = key[447:384];
	 subkey[703:640] = key[511:448];
	 subkey[767:704] = key[575:512];
	 subkey[831:768] = key[639:576];
	 subkey[895:832] = key[703:640] + tweak[191:128];
	 subkey[959:896] = key[767:704] + tweak[63:0];
	 subkey[1023:960] = key[831:768] + 14;
      end else if (subkeyCounter == 15) begin
	 subkey[63:0] = key[1023:960];
	 subkey[127:64] = key[1087:1024];
	 subkey[191:128] = key[63:0];
	 subkey[255:192] = key[127:64];
	 subkey[319:256] = key[191:128];
	 subkey[383:320] = key[255:192];
	 subkey[447:384] = key[319:256];
	 subkey[511:448] = key[383:320];
	 subkey[575:512] = key[447:384];
	 subkey[639:576] = key[511:448];
	 subkey[703:640] = key[575:512];
	 subkey[767:704] = key[639:576];
	 subkey[831:768] = key[703:640];
	 subkey[895:832] = key[767:704] + tweak[63:0];
	 subkey[959:896] = key[831:768] + tweak[127:64];
	 subkey[1023:960] = key[895:832] + 15;
      end else if (subkeyCounter == 16) begin
	 subkey[63:0] = key[1087:1024];
	 subkey[127:64] = key[63:0];
	 subkey[191:128] = key[127:64];
	 subkey[255:192] = key[191:128];
	 subkey[319:256] = key[255:192];
	 subkey[383:320] = key[319:256];
	 subkey[447:384] = key[383:320];
	 subkey[511:448] = key[447:384];
	 subkey[575:512] = key[511:448];
	 subkey[639:576] = key[575:512];
	 subkey[703:640] = key[639:576];
	 subkey[767:704] = key[703:640];
	 subkey[831:768] = key[767:704];
	 subkey[895:832] = key[831:768] + tweak[127:64];
	 subkey[959:896] = key[895:832] + tweak[191:128];
	 subkey[1023:960] = key[959:896] + 16;
      end else if (subkeyCounter == 17) begin
	 subkey[63:0] = key[63:0];
	 subkey[127:64] = key[127:64];
	 subkey[191:128] = key[191:128];
	 subkey[255:192] = key[255:192];
	 subkey[319:256] = key[319:256];
	 subkey[383:320] = key[383:320];
	 subkey[447:384] = key[447:384];
	 subkey[511:448] = key[511:448];
	 subkey[575:512] = key[575:512];
	 subkey[639:576] = key[639:576];
	 subkey[703:640] = key[703:640];
	 subkey[767:704] = key[767:704];
	 subkey[831:768] = key[831:768];
	 subkey[895:832] = key[895:832] + tweak[191:128];
	 subkey[959:896] = key[959:896] + tweak[63:0];
	 subkey[1023:960] = key[1023:960] + 17;
      end else if (subkeyCounter == 18) begin
	 subkey[63:0] = key[127:64];
	 subkey[127:64] = key[191:128];
	 subkey[191:128] = key[255:192];
	 subkey[255:192] = key[319:256];
	 subkey[319:256] = key[383:320];
	 subkey[383:320] = key[447:384];
	 subkey[447:384] = key[511:448];
	 subkey[511:448] = key[575:512];
	 subkey[575:512] = key[639:576];
	 subkey[639:576] = key[703:640];
	 subkey[703:640] = key[767:704];
	 subkey[767:704] = key[831:768];
	 subkey[831:768] = key[895:832];
	 subkey[895:832] = key[959:896] + tweak[63:0];
	 subkey[959:896] = key[1023:960] + tweak[127:64];
	 subkey[1023:960] = key[1087:1024] + 18;
      end else if (subkeyCounter == 19) begin
	 subkey[63:0] = key[191:128];
	 subkey[127:64] = key[255:192];
	 subkey[191:128] = key[319:256];
	 subkey[255:192] = key[383:320];
	 subkey[319:256] = key[447:384];
	 subkey[383:320] = key[511:448];
	 subkey[447:384] = key[575:512];
	 subkey[511:448] = key[639:576];
	 subkey[575:512] = key[703:640];
	 subkey[639:576] = key[767:704];
	 subkey[703:640] = key[831:768];
	 subkey[767:704] = key[895:832];
	 subkey[831:768] = key[959:896];
	 subkey[895:832] = key[1023:960] + tweak[127:64];
	 subkey[959:896] = key[1087:1024] + tweak[191:128];
	 subkey[1023:960] = key[63:0] + 19;
      end else if (subkeyCounter == 20) begin
	 subkey[63:0] = key[255:192];
	 subkey[127:64] = key[319:256];
	 subkey[191:128] = key[383:320];
	 subkey[255:192] = key[447:384];
	 subkey[319:256] = key[511:448];
	 subkey[383:320] = key[575:512];
	 subkey[447:384] = key[639:576];
	 subkey[511:448] = key[703:640];
	 subkey[575:512] = key[767:704];
	 subkey[639:576] = key[831:768];
	 subkey[703:640] = key[895:832];
	 subkey[767:704] = key[959:896];
	 subkey[831:768] = key[1023:960];
	 subkey[895:832] = key[1087:1024] + tweak[191:128];
	 subkey[959:896] = key[63:0] + tweak[63:0];
	 subkey[1023:960] = key[127:64] + 20;
      end // if (subkeyCounter == 20)
   end // always @ (*)
      
   always @(posedge clk) begin
      if (next == 1'b1 && reset == 1'b0) begin
	 subkeyCounter = subkeyCounter + 1'b1;
      end else if (reset == 1'b1) begin
	 subkeyCounter = 1'b0;
      end else begin
	 subkeyCounter = subkeyCounter;
      end
   end
endmodule
