module data_register (
  input clk_i,
  input write_low_i,
  input write_high_i,

  input [15:0] input_i,

  output [15:0] output_o
);

reg [9:0] data_d, data_q;
assign output_o = data_q;

always @(*) begin
  if (write_low_i)
    data_d = input_i[7:0];
  else
    data_d = data_q[7:0];

  if (write_high_i)
    data_d = input_i[15:8];
  else
    data_d = data_q[15:8];
end

always @(posedge clk_i) begin
  data_q <= data_d;
end

endmodule
