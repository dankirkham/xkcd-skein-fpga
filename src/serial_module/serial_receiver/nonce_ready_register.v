module nonce_ready_register (
  input clk_i,
  input nonce_ready_i,
  input nonce_ready_set_i,

  output nonce_ready_o
);

reg nonce_ready_d, nonce_ready_q;

assign nonce_ready_o = nonce_ready_q;

always @(*) begin
  if (nonce_ready_set_i)
    nonce_ready_d = nonce_ready_i;
  else
    nonce_ready_d = nonce_ready_q;
end

always @(posedge clk_i) begin
  nonce_ready_q <= nonce_ready_d;
end

endmodule
