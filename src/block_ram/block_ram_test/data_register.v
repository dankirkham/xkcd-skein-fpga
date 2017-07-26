module data_register (
  input clk_i,
  input write_low_i,
  input write_high_i,

  input [15:0] input_i,

  output [15:0] output_o
);

reg [15:0] data_d, data_q;
assign output_o = data_q;

always @(*) begin
  if (write_low_i)
    data_d[7:0] = input_i[7:0];
  else
    data_d[7:0] = data_q[7:0];

  if (write_high_i)
    data_d[15:8] = input_i[15:8];
  else
    data_d[15:8] = data_q[15:8];
end

always @(posedge clk_i) begin
  data_q <= data_d;
end

endmodule
