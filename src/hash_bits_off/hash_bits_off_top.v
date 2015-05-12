module hash_bits_off_top (
  input clk_i,
  input rst_i,
  input [1023:0] hash_xor_i,
  input new_hash_ready_i,
  output [9:0] hash_bits_off_o,
  output done_o
);

wire hash_xor_bit;
wire shift_add_and_decrement;
wire bit_counter_and_register_reset;
wire bit_counter_done;

hash_bits_off_shift_register hash_bits_off_shift_register (
  .clk_i(clk_i),
  .shift_i(shift_add_and_decrement),
  .write_i(new_hash_ready_i),
  .hash_xor_i(hash_xor_i),
  .hash_xor_bit_o(hash_xor_bit)
);

hash_bits_off_register hash_bits_off_register (
  .clk_i(clk_i),
  .reset_i(bit_counter_and_register_reset),
  .add_i(shift_add_and_decrement),
  .hash_xor_bit_i(hash_xor_bit),
  .hash_bits_off_register_o(hash_bits_off_o)
);

hash_bits_off_counter hash_bits_off_counter (
  .clk_i(clk_i),
  .reset_i(bit_counter_and_register_reset),
  .decrement_i(shift_add_and_decrement),
  .done_o(bit_counter_done)
);

hash_bits_off_state_machine hash_bits_off_state_machine (
  .clk_i(clk_i),
  .rst_i(rst_i),
  .new_hash_ready_i(new_hash_ready_i),
  .bit_counter_done_i(bit_counter_done),
  .shift_add_and_decrement_o(shift_add_and_decrement),
  .done_o(done_o),
  .bit_counter_and_register_reset_o(bit_counter_and_register_reset)
);

endmodule
