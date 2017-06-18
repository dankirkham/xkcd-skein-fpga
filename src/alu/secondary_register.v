module secondary_register (
  input clk_i,
  input [1:0] control_i,
  input [63:0] input_i,

  output [63:0] secondary_register_o
);

reg [63:0] secondary_register_d, secondary_register_q;
assign secondary_register_o = secondary_register_q;

always @(*) begin
  if (control_i == 2'b01) // Rotate left 16 bits
    secondary_register_d = {secondary_register_q[47:0], secondary_register_q[63:48]};
  else if (control_i == 2'b10) // Write lowest 16 bits
    secondary_register_d = {secondary_register_q[63:16], input_i[15:0]};
  else if (control_i == 2'b11) // Write full 64 bits
    secondary_register_d = input_i;
  else // Idle
    secondary_register_d = secondary_register_q;
end

always @(posedge clk_i) begin
  secondary_register_q <= secondary_register_d;
end

endmodule
