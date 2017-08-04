module core_output_mux (
  input [63:0] alu_output_i,
  input [15:0] ram_i,

  input select_i,

  output reg [63:0] output_o
);

always @(*) begin
  if (select_i)
    output_o = { 48'd0, ram_i };
  else
    output_o = alu_output_i;
  end
endmodule
