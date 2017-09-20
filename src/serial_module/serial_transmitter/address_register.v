module address_register (
  input clk_i,
  input increment_i,
  input reset_i,
  output [4:0] count_o
);

reg [4:0] count_d, count_q;

assign count_o = count_q;

always @(*) begin
  if (reset_i)
    count_d = 5'd0;
  else if (increment_i)
    count_d = count_q + 5'd1;
  else
    count_d = count_q;
end

always @(posedge clk_i) begin
  count_q <= count_d;
end

endmodule
