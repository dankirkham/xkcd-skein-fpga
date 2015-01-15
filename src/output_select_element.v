module output_select_element (
	input select_i,
	input [63:0] Y0_i,
	input [63:0] Y1_i,
	
	output [63:0] word_o
    );

reg [63:0] word;

assign word_o = word;

always @(*) begin
	if (select_i) // Y0
	begin
		word[63:0] = Y0_i[63:0];
	end else begin // Y1
		word[63:0] = Y1_i[63:0];
	end
end

endmodule
