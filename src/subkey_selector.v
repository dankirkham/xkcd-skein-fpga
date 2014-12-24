module subkey_selector (
	input clk_i,
	input rst_i,
	input [4:0] subkey_select_i,
	input [3:0] word_select_i,
	input write_i,
	input [63:0] word_i,
	output [63:0] word_o
    );
	 
reg word;

assign word_o = word;


endmodule