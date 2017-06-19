module bit_counter_register (
  input clk_i,
  input write_i,
  input increment_i,

  input [9:0] primary_register_i,

  output [9:0] bit_counter_o
);

reg [9:0] bit_counter_d, bit_counter_q;
assign bit_counter_o = bit_counter_q;

always @(*) begin
  if (write_i)
    bit_counter_d = primary_register_i;
  else if (increment_i)
    bit_counter_d = bit_counter_q + {9'd0, primary_register_i[0]};
  else
    bit_counter_d = bit_counter_q;
end

always @(posedge clk_i) begin
  bit_counter_q <= bit_counter_d;
end

endmodule
