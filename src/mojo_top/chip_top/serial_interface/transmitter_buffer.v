module transmitter_buffer (
  input clk_i,
  input [255:0] nonce_i,
  input shift_i,
  input write_i,
  output [7:0] byte_o
);

reg [255:0] nonce_d, nonce_q;

assign byte_o[7:0] = nonce_q[7:0];

always @(*) begin
  if (write_i)
    nonce_d = nonce_i;
  else if (shift_i)
    nonce_d = {8'd0, nonce_q[255:8]}; // LSB First
  else
    nonce_d = nonce_q;
end

always @(posedge clk_i) begin
  nonce_q <= nonce_d;
end

endmodule
