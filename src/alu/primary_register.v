module primary_register (
  input clk_i,
  input [2:0] control_i,
  input [63:0] input_i,

  output [63:0] primary_register_o
);

reg [63:0] primary_register_d, primary_register_q;
assign primary_register_o = primary_register_q;

always @(*) begin
  if (control_i == 3'b110) // Write lowest 16 bits
    primary_register_d = {primary_register_q[63:16], input_i[15:0]};
  else if (control_i == 3'b111) // Write full 64 bits
    primary_register_d = input_i;
  else if (control_i == 3'b010) // Rotate left 16 bits
    primary_register_d = {primary_register_q[47:0], primary_register_q[63:48]};
  else if (control_i == 3'b001) // Rotate left 1 bit
    primary_register_d = {primary_register_q[62:0], primary_register_q[63]};
  else // Idle
    primary_register_d = primary_register_q;
end

always @(posedge clk_i) begin
  primary_register_q <= primary_register_d;
end

endmodule
