module constants_rom (
  input [5:0] address_i,
  input output_enable_i,
  output reg [63:0] constant_o
);

reg [63:0] constants [0:57];

initial $readmemh("../constants_rom/constants.hex", constants);

always @(*) begin
  if (output_enable_i)
    constant_o = constants[address_i];
  else
    constant_o = 64'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;
end

endmodule
