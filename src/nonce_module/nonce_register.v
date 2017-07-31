module nonce_register (
  input clk_i,

  input [7:0] rx_byte_i,
  input shift_in_i,
  input increment_i,
  input ready_i,

  output [95:0] output_o
);

reg [95:0] nonce_d, nonce_q;
assign output_o = nonce_q;

always @(*) begin
  if (ready_i)
    if (increment_i)
      nonce_d = nonce_q + 1;
    else
      nonce_d = nonce_q;
  else
    if (shift_in_i)
      nonce_d = { rx_byte_i[7:0], nonce_q[95:8] };
    else
      nonce_d = nonce_q;
end

always @(posedge clk_i) begin
  nonce_q <= nonce_d;
end

endmodule
