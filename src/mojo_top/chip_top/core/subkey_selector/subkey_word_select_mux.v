module subkey_word_select_mux (
	input [3:0] select_i,
	input [63:0] word_default_i,
	input [63:0] word_13_i,
	input [63:0] word_14_i,
	input [63:0] word_15_i,
	output [63:0] word_o
    );
	 
reg [63:0] word;

assign word_o = word;


always @(*) begin
	if (select_i == 4'd13) begin
		word = word_13_i;
	end else if (select_i == 4'd14) begin
		word = word_14_i;
	end else if (select_i == 4'd15) begin
		word = word_15_i;
	end else begin
		word = word_default_i;
	end
end

endmodule