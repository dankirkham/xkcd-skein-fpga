module nonce_counter (
  input clk_i,
  input zero_i,
  input increment_i,

  output [3:0] count_o
);

reg [3:0] count_d, count_q;
assign count_o = count_q;

always @(*) begin
  if (zero_i)
    count_d = 4'd0;
  else if (increment_i)
    count_d = count_q + 4'd1;
  else
    count_d = count_q;
end

always @(posedge clk_i) begin
  count_q <= count_d;
end

endmodule
