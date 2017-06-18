module passthrough_demux (
  input [63:0] primary_register_i,
  input [63:0] secondary_register_i,

  input primary_register_select_i,
  input comparator_select_i,

  output reg [63:0] output_o
);

always @(*) begin
  if (primary_register_select_i)
    output_o = primary_register_i;
  else begin
    if (comparator_select_i)
      output_o = primary_register_i;
    else
      output_o = secondary_register_i;
  end
end

endmodule
