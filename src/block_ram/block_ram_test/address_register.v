module address_register (
  input clk_i,
  input write_i,

  input [7:0] input_i,

  output [7:0] output_o
);

reg [7:0] address_d, address_q;
assign output_o = address_q;

always @(*) begin
  if (write_i)
    address_d = input_i[7:0];
  else
    address_d = address_q[7:0];
end

always @(posedge clk_i) begin
  address_q <= address_d;
end

endmodule
