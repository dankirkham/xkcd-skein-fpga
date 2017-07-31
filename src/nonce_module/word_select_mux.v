module word_select_mux (
  input [47:0] low_word_i,
  input [47:0] high_word_i,

  input select_i,

  output reg [47:0] output_o
);

always @(*) begin
  if (select_i == 1'b0)
    output_o = low_word_i;
  else
    output_o = high_word_i;
end

endmodule
