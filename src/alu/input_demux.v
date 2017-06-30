module input_demux (
  input [63:0] alu_input_i,
  input [63:0] alu_output_i,

  input select_i,

  output reg [63:0] output_o
);

always @(*) begin
  if (select_i)
    output_o = alu_output_i;
  else
    output_o = alu_input_i;
  end
endmodule
