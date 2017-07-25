module data_register_demux (
  input [15:0] data_word_i,
  input [7:0] rx_byte_i,

  input select_i,

  output reg [15:0] output_o
);

always @(*) begin
  if (select_i)
    output_o = data_word_i;
  else begin
    output_o = {rx_byte_i[7:0], rx_byte_i[7:0]};
  end
end

endmodule
