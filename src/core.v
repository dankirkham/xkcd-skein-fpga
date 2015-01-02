module core (
	input clk_i,
	input rst_i,
	input [4:0] subkey_select_i,
	input [3:0] subkey_word_select_i,
	input write_i,
	input [63:0] add64_word_i,
	input [63:0] key_word_i,
	output [3:0] key_word_select_o,
	output [63:0] word_o
    );
	
endmodule