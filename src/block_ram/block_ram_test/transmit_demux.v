module transmit_demux (
  input [7:0] data_i,
  input [7:0] header_i,

  input select_i,

  output reg [7:0] output_o
);

always @(*) begin
  if (select_i)
    output_o = header_i;
  else begin
    output_o = data_i;
  end
end

endmodule
