module tf_rotate (
		  input [63:0] in,
		  output [63:0] out
		  );
   parameter D=0;
   parameter J=0;

   reg 				RC;
   reg [63:0] 			rotate;

   assign out = rotate;

   generate
      case (D)
	0:
	  case (J)
	    0:
	      always @(*) begin
		 rotate[63:24] = in[39:0];
		 rotate[23:0] = in[63:40];
	      end
	    1:
	      always @(*) begin
		 rotate[63:13] = in[50:0];
		 rotate[12:0] = in[63:51];
	      end
	    2:
	      always @(*) begin
		 rotate[63:8] = in[55:0];
		 rotate[7:0] = in[63:56];
	      end
	    3:
	      always @(*) begin
		 rotate[63:47] = in[16:0];
		 rotate[46:0] = in[63:17];
	      end
	    4:
	      always @(*) begin
		 rotate[63:8] = in[55:0];
		 rotate[7:0] = in[63:56];
	      end
	    5:
	      always @(*) begin
		 rotate[63:17] = in[46:0];
		 rotate[16:0] = in[63:47];
	      end
	    6:
	      always @(*) begin
		 rotate[63:22] = in[41:0];
		 rotate[21:0] = in[63:42];
	      end
	    7:
	      always @(*) begin
		 rotate[63:37] = in[26:0];
		 rotate[36:0] = in[63:27];
	      end
	  endcase // case (J)
	1:
	  case (J)
	    0:
	      always @(*) begin
		 rotate[63:38] = in[25:0];
		 rotate[37:0] = in[63:26];
	      end
	    1:
	      always @(*) begin
		 rotate[63:19] = in[44:0];
		 rotate[18:0] = in[63:45];
	      end
	    2:
	      always @(*) begin
		 rotate[63:10] = in[53:0];
		 rotate[9:0] = in[63:54];
	      end
	    3:
	      always @(*) begin
		 rotate[63:55] = in[8:0];
		 rotate[54:0] = in[63:9];
	      end
	    4:
	      always @(*) begin
		 rotate[63:49] = in[14:0];
		 rotate[48:0] = in[63:15];
	      end
	    5:
	      always @(*) begin
		 rotate[63:18] = in[45:0];
		 rotate[17:0] = in[63:46];
	      end
	    6:
	      always @(*) begin
		 rotate[63:23] = in[40:0];
		 rotate[22:0] = in[63:41];
	      end
	    7:
	      always @(*) begin
		 rotate[63:52] = in[11:0];
		 rotate[51:0] = in[63:12];
	      end
	  endcase // case (J)
	2:
	  case (J)
	    0:
	      always @(*) begin
		 rotate[63:33] = in[30:0];
		 rotate[32:0] = in[63:31];
	      end
	    1:
	      always @(*) begin
		 rotate[63:4] = in[59:0];
		 rotate[3:0] = in[63:60];
	      end
	    2:
	      always @(*) begin
		 rotate[63:51] = in[12:0];
		 rotate[50:0] = in[63:13];
	      end
	    3:
	      always @(*) begin
		 rotate[63:13] = in[50:0];
		 rotate[12:0] = in[63:51];
	      end
	    4:
	      always @(*) begin
		 rotate[63:34] = in[29:0];
		 rotate[33:0] = in[63:30];
	      end
	    5:
	      always @(*) begin
		 rotate[63:41] = in[22:0];
		 rotate[40:0] = in[63:23];
	      end
	    6:
	      always @(*) begin
		 rotate[63:59] = in[4:0];
		 rotate[58:0] = in[63:5];
	      end
	    7:
	      always @(*) begin
		 rotate[63:17] = in[46:0];
		 rotate[16:0] = in[63:47];
	      end
	  endcase // case (J)
	3:
	  case (J)
	    0:
	      always @(*) begin
		 rotate[63:5] = in[58:0];
		 rotate[4:0] = in[63:59];
	      end
	    1:
	      always @(*) begin
		 rotate[63:20] = in[43:0];
		 rotate[19:0] = in[63:44];
	      end
	    2:
	      always @(*) begin
		 rotate[63:48] = in[15:0];
		 rotate[47:0] = in[63:16];
	      end
	    3:
	      always @(*) begin
		 rotate[63:41] = in[22:0];
		 rotate[40:0] = in[63:23];
	      end
	    4:
	      always @(*) begin
		 rotate[63:47] = in[16:0];
		 rotate[46:0] = in[63:17];
	      end
	    5:
	      always @(*) begin
		 rotate[63:28] = in[35:0];
		 rotate[27:0] = in[63:36];
	      end
	    6:
	      always @(*) begin
		 rotate[63:16] = in[47:0];
		 rotate[15:0] = in[63:48];
	      end
	    7:
	      always @(*) begin
		 rotate[63:25] = in[38:0];
		 rotate[24:0] = in[63:39];
	      end
	  endcase // case (J)
	4:
	  case (J)
	    0:
	      always @(*) begin
		 rotate[63:41] = in[22:0];
		 rotate[40:0] = in[63:23];
	      end
	    1:
	      always @(*) begin
		 rotate[63:9] = in[54:0];
		 rotate[8:0] = in[63:55];
	      end
	    2:
	      always @(*) begin
		 rotate[63:37] = in[26:0];
		 rotate[36:0] = in[63:27];
	      end
	    3:
	      always @(*) begin
		 rotate[63:31] = in[32:0];
		 rotate[30:0] = in[63:33];
	      end
	    4:
	      always @(*) begin
		 rotate[63:12] = in[51:0];
		 rotate[11:0] = in[63:52];
	      end
	    5:
	      always @(*) begin
		 rotate[63:47] = in[16:0];
		 rotate[46:0] = in[63:17];
	      end
	    6:
	      always @(*) begin
		 rotate[63:44] = in[19:0];
		 rotate[43:0] = in[63:20];
	      end
	    7:
	      always @(*) begin
		 rotate[63:30] = in[33:0];
		 rotate[29:0] = in[63:34];
	      end
	  endcase // case (J)
	5:
	  case (J)
	    0:
	      always @(*) begin
		 rotate[63:16] = in[47:0];
		 rotate[15:0] = in[63:48];
	      end
	    1:
	      always @(*) begin
		 rotate[63:34] = in[29:0];
		 rotate[33:0] = in[63:30];
	      end
	    2:
	      always @(*) begin
		 rotate[63:56] = in[7:0];
		 rotate[55:0] = in[63:8];
	      end
	    3:
	      always @(*) begin
		 rotate[63:51] = in[12:0];
		 rotate[50:0] = in[63:13];
	      end
	    4:
	      always @(*) begin
		 rotate[63:4] = in[59:0];
		 rotate[3:0] = in[63:60];
	      end
	    5:
	      always @(*) begin
		 rotate[63:53] = in[10:0];
		 rotate[52:0] = in[63:11];
	      end
	    6:
	      always @(*) begin
		 rotate[63:42] = in[21:0];
		 rotate[41:0] = in[63:22];
	      end
	    7:
	      always @(*) begin
		 rotate[63:41] = in[22:0];
		 rotate[40:0] = in[63:23];
	      end
	  endcase // case (J)
	6:
	  case (J)
	    0:
	      always @(*) begin
		 rotate[63:31] = in[32:0];
		 rotate[30:0] = in[63:33];
	      end
	    1:
	      always @(*) begin
		 rotate[63:44] = in[19:0];
		 rotate[43:0] = in[63:20];
	      end
	    2:
	      always @(*) begin
		 rotate[63:47] = in[16:0];
		 rotate[46:0] = in[63:17];
	      end
	    3:
	      always @(*) begin
		 rotate[63:46] = in[17:0];
		 rotate[45:0] = in[63:18];
	      end
	    4:
	      always @(*) begin
		 rotate[63:19] = in[44:0];
		 rotate[18:0] = in[63:45];
	      end
	    5:
	      always @(*) begin
		 rotate[63:42] = in[21:0];
		 rotate[41:0] = in[63:22];
	      end
	    6:
	      always @(*) begin
		 rotate[63:44] = in[19:0];
		 rotate[43:0] = in[63:20];
	      end
	    7:
	      always @(*) begin
		 rotate[63:25] = in[38:0];
		 rotate[24:0] = in[63:39];
	      end
	  endcase // case (J)
	7:
	  case (J)
	    0:
	      always @(*) begin
		 rotate[63:9] = in[54:0];
		 rotate[8:0] = in[63:55];
	      end
	    1:
	      always @(*) begin
		 rotate[63:48] = in[15:0];
		 rotate[47:0] = in[63:16];
	      end
	    2:
	      always @(*) begin
		 rotate[63:35] = in[28:0];
		 rotate[34:0] = in[63:29];
	      end
	    3:
	      always @(*) begin
		 rotate[63:52] = in[11:0];
		 rotate[51:0] = in[63:12];
	      end
	    4:
	      always @(*) begin
		 rotate[63:23] = in[40:0];
		 rotate[22:0] = in[63:41];
	      end
	    5:
	      always @(*) begin
		 rotate[63:31] = in[32:0];
		 rotate[30:0] = in[63:33];
	      end
	    6:
	      always @(*) begin
		 rotate[63:37] = in[26:0];
		 rotate[36:0] = in[63:27];
	      end
	    7:
	      always @(*) begin
		 rotate[63:20] = in[43:0];
		 rotate[19:0] = in[63:44];
	      end
	  endcase // case (J)
      endcase // case (D)
   endgenerate
endmodule
