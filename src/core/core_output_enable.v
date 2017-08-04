module core_output_enable (
  input [63:0] input_i,

  input enable_i,

  output reg [63:0] output_o
);

always @(*) begin
  if (enable_i)
    output_o = input_i;
  else
    output_o = 64'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;
end

endmodule
