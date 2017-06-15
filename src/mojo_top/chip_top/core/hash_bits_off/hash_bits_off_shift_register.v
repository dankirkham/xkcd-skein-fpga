module hash_bits_off_shift_register (
  input clk_i,
  input shift_i,
  input write_i,
  input [1023:0] hash_xor_i,
  output hash_xor_bit_o
);

reg [1023:0] hash_xor_d, hash_xor_q;

assign hash_xor_bit_o = hash_xor_q[0];

always @(*) begin
  if (write_i) begin
    hash_xor_d = hash_xor_i;
  end else begin
    if (shift_i) begin
      hash_xor_d = {1'b0, hash_xor_q[1023:1]};
    end else begin
      hash_xor_d = hash_xor_q;
    end
  end
end

always @(posedge clk_i) begin
  hash_xor_q <= hash_xor_d;
end

endmodule
