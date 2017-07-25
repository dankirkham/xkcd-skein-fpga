module byte_select_demux (
  input [15:0] data_word_i,

  input select_i,

  output reg [7:0] output_o
);

always @(*) begin
  if (select_i)
    output_o = data_word_i[15:8];
  else begin
    output_o = data_word_i[7:0];
  end
end

endmodule
