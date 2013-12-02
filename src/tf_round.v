module tf_round (
		 input 		 clk,
		 input [1023:0]  plaintext,
		 output [1023:0] cyphertext,
		 input [1023:0]  subkey
		 );

   parameter RND = 0;
   
   wire [63:0]			 pt0;
   wire [63:0]			 pt1;
   wire [63:0]			 pt2;
   wire [63:0]			 pt3;
   wire [63:0]			 pt4;
   wire [63:0]			 pt5;
   wire [63:0]			 pt6;
   wire [63:0]			 pt7;
   wire [63:0]			 pt8;
   wire [63:0]			 pt9;
   wire [63:0]			 pt10;
   wire [63:0]			 pt11;
   wire [63:0]			 pt12;
   wire [63:0]			 pt13;
   wire [63:0]			 pt14;
   wire [63:0]			 pt15;

   wire [63:0]			 y0_0;
   wire [63:0]			 y0_1;
   wire [63:0]			 y0_2;
   wire [63:0]			 y0_3;
   wire [63:0]			 y0_4;
   wire [63:0]			 y0_5;
   wire [63:0]			 y0_6;
   wire [63:0]			 y0_7;

   wire [63:0] 			 r1_0;
   wire [63:0]			 r1_1;
   wire [63:0]			 r1_2;
   wire [63:0]			 r1_3;
   wire [63:0]			 r1_4;
   wire [63:0]			 r1_5;
   wire [63:0]			 r1_6;
   wire [63:0]			 r1_7;			 

   reg [63:0]			 y1_0;
   reg [63:0]			 y1_1;
   reg [63:0]			 y1_2;
   reg [63:0]			 y1_3;
   reg [63:0]			 y1_4;
   reg [63:0]			 y1_5;
   reg [63:0]			 y1_6;
   reg [63:0]			 y1_7;	

   wire [1023:0] 		 p;
   assign p = { y0_0, y1_0,
		y0_1, y1_1,
		y0_2, y1_2,
		y0_3, y1_3,
		y0_4, y1_4,
		y0_5, y1_5,
		y0_6, y1_6,
		y0_7, y1_7 };

   assign pt0 = plaintext[63:0];
   assign pt1 = plaintext[127:64];
   assign pt2 = plaintext[191:128];
   assign pt3 = plaintext[255:192];
   assign pt4 = plaintext[319:256];
   assign pt5 = plaintext[383:320];
   assign pt6 = plaintext[447:384];
   assign pt7 = plaintext[511:448];
   assign pt8 = plaintext[575:512];
   assign pt9 = plaintext[639:576];
   assign pt10 = plaintext[703:640];
   assign pt11 = plaintext[767:704];
   assign pt12 = plaintext[831:768];
   assign pt13 = plaintext[895:832];
   assign pt14 = plaintext[959:896];
   assign pt15 = plaintext[1023:960];

   add64 (
	  .a(pt0),
	  .b(pt1),
	  .c(y0_0)
	  );
   
   add64 (
	  .a(pt2),
	  .b(pt3),
	  .c(y0_1)
	  );
   
   add64 (
	  .a(pt4),
	  .b(pt5),
	  .c(y0_2)
	  );
   
   add64 (
	  .a(pt6),
	  .b(pt7),
	  .c(y0_3)
	  );
   
   add64 (
	  .a(pt8),
	  .b(pt9),
	  .c(y0_4)
	  );
   
   add64 (
	  .a(pt10),
	  .b(pt11),
	  .c(y0_5)
	  );
   
   add64 (
	  .a(pt12),
	  .b(pt13),
	  .c(y0_6)
	  );
   
   add64 (
	  .a(pt14),
	  .b(pt15),
	  .c(y0_7)
	  );

   tf_key_scheduler (
		     .clk(clk),
		     .next(),
		     .reset(),
		     .key(),
		     .tweak(),
		     .subkey()
		     );
   
   tf_rotate #(RND, 0) (
		      .in(pt1),
		      .out(r1_0)
		      );

   tf_rotate #(RND, 1) (
		      .in(pt3),
		      .out(r1_1)
		      );

   tf_rotate #(RND, 2) (
		      .in(pt5),
		      .out(r1_2)
		      );

   tf_rotate #(RND, 3) (
		      .in(pt7),
		      .out(r1_3)
		      );

   tf_rotate #(RND, 4) (
		      .in(pt9),
		      .out(r1_4)
		      );

   tf_rotate #(RND, 5) (
		      .in(pt11),
		      .out(r1_5)
		      );

   tf_rotate #(RND, 6) (
		      .in(pt13),
		      .out(r1_6)
		      );

   tf_rotate #(RND, 7) (
		      .in(pt15),
		      .out(r1_7)
		      );

   tf_permute (
	       .in(p),
	       .out_o(cyphertext)
	       );

   always @(*) begin
      y1_0 = r1_0 ^ y0_0;
      y1_1 = r1_1 ^ y0_1;
      y1_2 = r1_2 ^ y0_2;
      y1_3 = r1_3 ^ y0_3;
      y1_4 = r1_4 ^ y0_4;
      y1_5 = r1_5 ^ y0_5;
      y1_6 = r1_6 ^ y0_6;
      y1_7 = r1_7 ^ y0_7;
   end
   
endmodule
