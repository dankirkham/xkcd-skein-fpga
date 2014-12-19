`timescale 1ns / 1ps
module rotator (
	input [63:0] word_i,
	input [2:0] d_i, // Round
	input [2:0] j_i, // Word
	
	output [63:0] rotated_word_o
    );
	 
reg [63:0] rotated_word;

assign rotated_word_o = rotated_word;

always @(*) begin
	if (d_i == 3'd0)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotated_word[63:24] = word_i[39:0];
						 rotated_word[23:0] = word_i[63:40];
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotated_word[63:13] = word_i[50:0];
						 rotated_word[12:0] = word_i[63:51];
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotated_word[63:8] = word_i[55:0];
						 rotated_word[7:0] = word_i[63:56];
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotated_word[63:47] = word_i[16:0];
						 rotated_word[46:0] = word_i[63:17];
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotated_word[63:8] = word_i[55:0];
						 rotated_word[7:0] = word_i[63:56];
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotated_word[63:17] = word_i[46:0];
						 rotated_word[16:0] = word_i[63:47];
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotated_word[63:22] = word_i[41:0];
						 rotated_word[21:0] = word_i[63:42];
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotated_word[63:37] = word_i[26:0];
						 rotated_word[36:0] = word_i[63:27];
			  end
	end
	else if (d_i == 3'd1)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotated_word[63:38] = word_i[25:0];
						 rotated_word[37:0] = word_i[63:26];
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotated_word[63:19] = word_i[44:0];
						 rotated_word[18:0] = word_i[63:45];
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotated_word[63:10] = word_i[53:0];
						 rotated_word[9:0] = word_i[63:54];
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotated_word[63:55] = word_i[8:0];
						 rotated_word[54:0] = word_i[63:9];
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotated_word[63:49] = word_i[14:0];
						 rotated_word[48:0] = word_i[63:15];
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotated_word[63:18] = word_i[45:0];
						 rotated_word[17:0] = word_i[63:46];
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotated_word[63:23] = word_i[40:0];
						 rotated_word[22:0] = word_i[63:41];
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotated_word[63:52] = word_i[11:0];
						 rotated_word[51:0] = word_i[63:12];
			  end
	end
	else if (d_i == 3'd2)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotated_word[63:33] = word_i[30:0];
						 rotated_word[32:0] = word_i[63:31];
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotated_word[63:4] = word_i[59:0];
						 rotated_word[3:0] = word_i[63:60];
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotated_word[63:51] = word_i[12:0];
						 rotated_word[50:0] = word_i[63:13];
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotated_word[63:13] = word_i[50:0];
						 rotated_word[12:0] = word_i[63:51];
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotated_word[63:34] = word_i[29:0];
						 rotated_word[33:0] = word_i[63:30];
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotated_word[63:41] = word_i[22:0];
						 rotated_word[40:0] = word_i[63:23];
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotated_word[63:59] = word_i[4:0];
						 rotated_word[58:0] = word_i[63:5];
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotated_word[63:17] = word_i[46:0];
						 rotated_word[16:0] = word_i[63:47];
			  end
	end
	else if (d_i == 3'd3)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotated_word[63:5] = word_i[58:0];
						 rotated_word[4:0] = word_i[63:59];
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotated_word[63:20] = word_i[43:0];
						 rotated_word[19:0] = word_i[63:44];
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotated_word[63:48] = word_i[15:0];
						 rotated_word[47:0] = word_i[63:16];
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotated_word[63:41] = word_i[22:0];
						 rotated_word[40:0] = word_i[63:23];
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotated_word[63:47] = word_i[16:0];
						 rotated_word[46:0] = word_i[63:17];
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotated_word[63:28] = word_i[35:0];
						 rotated_word[27:0] = word_i[63:36];
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotated_word[63:16] = word_i[47:0];
						 rotated_word[15:0] = word_i[63:48];
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotated_word[63:25] = word_i[38:0];
						 rotated_word[24:0] = word_i[63:39];
			  end
	end
	else if (d_i == 3'd4)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotated_word[63:41] = word_i[22:0];
						 rotated_word[40:0] = word_i[63:23];
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotated_word[63:9] = word_i[54:0];
						 rotated_word[8:0] = word_i[63:55];
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotated_word[63:37] = word_i[26:0];
						 rotated_word[36:0] = word_i[63:27];
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotated_word[63:31] = word_i[32:0];
						 rotated_word[30:0] = word_i[63:33];
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotated_word[63:12] = word_i[51:0];
						 rotated_word[11:0] = word_i[63:52];
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotated_word[63:47] = word_i[16:0];
						 rotated_word[46:0] = word_i[63:17];
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotated_word[63:44] = word_i[19:0];
						 rotated_word[43:0] = word_i[63:20];
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotated_word[63:30] = word_i[33:0];
						 rotated_word[29:0] = word_i[63:34];
			  end
	end
	else if (d_i == 3'd5)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotated_word[63:16] = word_i[47:0];
						 rotated_word[15:0] = word_i[63:48];
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotated_word[63:34] = word_i[29:0];
						 rotated_word[33:0] = word_i[63:30];
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotated_word[63:56] = word_i[7:0];
						 rotated_word[55:0] = word_i[63:8];
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotated_word[63:51] = word_i[12:0];
						 rotated_word[50:0] = word_i[63:13];
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotated_word[63:4] = word_i[59:0];
						 rotated_word[3:0] = word_i[63:60];
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotated_word[63:53] = word_i[10:0];
						 rotated_word[52:0] = word_i[63:11];
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotated_word[63:42] = word_i[21:0];
						 rotated_word[41:0] = word_i[63:22];
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotated_word[63:41] = word_i[22:0];
						 rotated_word[40:0] = word_i[63:23];
			  end
	end
	else if (d_i == 3'd6)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotated_word[63:31] = word_i[32:0];
						 rotated_word[30:0] = word_i[63:33];
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotated_word[63:44] = word_i[19:0];
						 rotated_word[43:0] = word_i[63:20];
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotated_word[63:47] = word_i[16:0];
						 rotated_word[46:0] = word_i[63:17];
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotated_word[63:46] = word_i[17:0];
						 rotated_word[45:0] = word_i[63:18];
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotated_word[63:19] = word_i[44:0];
						 rotated_word[18:0] = word_i[63:45];
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotated_word[63:42] = word_i[21:0];
						 rotated_word[41:0] = word_i[63:22];
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotated_word[63:44] = word_i[19:0];
						 rotated_word[43:0] = word_i[63:20];
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotated_word[63:25] = word_i[38:0];
						 rotated_word[24:0] = word_i[63:39];
			  end
	end
	else if (d_i == 3'd7)
	begin
			  if (j_i == 3'd0)
			  begin
						 rotated_word[63:9] = word_i[54:0];
						 rotated_word[8:0] = word_i[63:55];
			  end
			  else if (j_i == 3'd1)
			  begin
						 rotated_word[63:48] = word_i[15:0];
						 rotated_word[47:0] = word_i[63:16];
			  end
			  else if (j_i == 3'd2)
			  begin
						 rotated_word[63:35] = word_i[28:0];
						 rotated_word[34:0] = word_i[63:29];
			  end
			  else if (j_i == 3'd3)
			  begin
						 rotated_word[63:52] = word_i[11:0];
						 rotated_word[51:0] = word_i[63:12];
			  end
			  else if (j_i == 3'd4)
			  begin
						 rotated_word[63:23] = word_i[40:0];
						 rotated_word[22:0] = word_i[63:41];
			  end
			  else if (j_i == 3'd5)
			  begin
						 rotated_word[63:31] = word_i[32:0];
						 rotated_word[30:0] = word_i[63:33];
			  end
			  else if (j_i == 3'd6)
			  begin
						 rotated_word[63:37] = word_i[26:0];
						 rotated_word[36:0] = word_i[63:27];
			  end
			  else if (j_i == 3'd7)
			  begin
						 rotated_word[63:20] = word_i[43:0];
						 rotated_word[19:0] = word_i[63:44];
			  end
	end
end

endmodule