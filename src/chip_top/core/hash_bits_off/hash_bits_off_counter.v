module hash_bits_off_counter (
  input clk_i,
  input reset_i,
  input decrement_i,
  output reg done_o
);

reg [9:0] bits_d, bits_q;

always @(*) begin
  if (reset_i) begin
    bits_d = 10'd0;
  end else begin
    if (decrement_i) begin
      bits_d = bits_q + 1'b1;
    end else begin
      bits_d = bits_q;
    end
  end

  if (bits_q == 10'd1023) begin
    done_o = 1'b1;
  end else begin
    done_o = 1'b0;
  end
end

always @(posedge clk_i) begin
  bits_q <= bits_d;
end

endmodule
