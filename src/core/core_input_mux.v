module core_input_mux (
  input [63:0] alu_input_i,
  input [23:0] core_id_i,
  input [15:0] ram_i,

  input [1:0] select_i,

  output reg [63:0] output_o
);

always @(*) begin
  if (select_i == 2'b01)
    output_o = { 48'd0, ram_i };
  else if (select_i == 2'b10)
    output_o = { 40'd0, core_id_i };
  else
    output_o = alu_input_i;
  end
endmodule
