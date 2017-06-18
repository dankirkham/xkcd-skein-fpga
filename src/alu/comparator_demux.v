module comparator_demux (
  input [9:0] bit_counter_register_i,
  input [9:0] compare_register_i,

  input bit_counter_select_i,
  input comparator_select_i,

  output reg [9:0] output_o
);

always @(*) begin
  if (bit_counter_select_i)
    output_o = bit_counter_register_i;
  else begin
    if (comparator_select_i)
      output_o = bit_counter_register_i;
    else
      output_o = compare_register_i;
  end
end

endmodule
