module timeout_timer (
  input clk_i,
  input reset_i,

  output reg timed_out_o
);

// This module currently counts to 50 million. On a 50 MHz Spartan 6, this
// corresponds to a 1 second timer.

reg [25:0] counter_d, counter_q;

always @(*) begin
  if (reset_i) begin
    counter_d = 0;
  end else begin
    if (counter_q >= 26'd50000000) begin
      counter_d = counter_q;
    end else begin
      counter_d = counter_q + 1'b1;
    end
  end
end

always @(*) begin
  if (counter_q >= 26'd50000000)
    timed_out_o = 1'b1;
  else
    timed_out_o = 1'b0;
end

always @(posedge clk_i) begin
  counter_d <= counter_q;
end

endmodule
