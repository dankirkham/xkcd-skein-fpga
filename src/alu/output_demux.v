module output_demux (
  input [9:0] comparator_demux_i,
  input [63:0] passthrough_demux_i,
  input [63:0] xor_i,
  input [63:0] adder_i,

  input [1:0] select_i,

  output reg [63:0] output_o
);

always @(*) begin
  if (select_i == 2'b00)
    output_o = {54'd0, comparator_demux_i};
  else if (select_i == 2'b01)
    output_o = passthrough_demux_i;
  else if (select_i == 2'b10)
    output_o = xor_i;
  else // select_i == 2'b11
    output_o = adder_i;
end

endmodule
