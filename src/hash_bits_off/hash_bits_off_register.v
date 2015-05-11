module hash_bits_off_register (
  input clk_i,
  input reset_i,
  input add_i,
  input hash_xor_bit_i,
  output [9:0] hash_bits_off_register_o
);

reg [9:0] hash_bits_off_register_d, hash_bits_off_register_q;

always @(*) begin
  if (reset_i) begin
    hash_bits_off_register_d = 10'd0;
  end else if (add_i) begin
    hash_bits_off_register_d = hash_bits_off_register_q + hash_xor_bit_i;
  end else begin
    hash_bits_off_register_d = hash_bits_off_register_q;
  end
end

always @(posedge clk_i) begin
  hash_bits_off_register_q <= hash_bits_off_register_d;
end

endmodule
