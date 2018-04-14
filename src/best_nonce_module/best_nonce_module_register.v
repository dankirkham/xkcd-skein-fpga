module best_nonce_module_register (
  input clk_i,
  input write_i,
  input [23:0] input_i,
  output [23:0] output_o
);

reg [23:0] data_d, data_q;

assign output_o = data_q;

always @(*) begin
  if (write_i)
    data_d = input_i;
  else
    data_d = data_q;
end

always @(posedge clk_i) begin
  data_q <= data_d;
end

endmodule
