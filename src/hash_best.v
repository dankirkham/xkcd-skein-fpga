module hash_best (
  input clk_i,
  input [9:0] bits_off_i,
  input [255:0] nonce_i,
  input reset_i, // For now we use the signal from transmitter, reset after sending
  input new_hash_i,
  output [255:0] best_nonce_o,
  output [9:0] best_bits_off_o
);

reg [255:0] best_nonce_d, best_nonce_q;
reg [9:0] best_bits_off_d, best_bits_off_q;

assign best_nonce_o = best_nonce_q;
assign best_bits_off_o = best_bits_off_q;

always @(*) begin
  if (reset_i) begin
    best_nonce_d = best_nonce_q;
    best_bits_off_d = 10'b1111111111;
  end else begin
    if (new_hash_i) begin
      if (bits_off_i < best_bits_off_q) begin
        best_nonce_d = nonce_i;
        best_bits_off_d = bits_off_i;
      end
    end else begin
      best_nonce_d = best_nonce_q;
      best_bits_off_d = best_bits_off_q;
    end
  end
end

always @(posedge clk_i) begin
  best_nonce_q <= best_nonce_d;
  best_bits_off_q <= best_bits_off_d;
end

endmodule
