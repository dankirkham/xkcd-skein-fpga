module hash_bits_off_state_machine (
  input clk_i,
  input new_hash_ready_i,
  input bit_counter_done_i,

  // Moore Outputs
  output reg shift_add_and_decrement_o,
  output reg done_o,

  // Mealy Outputs
  output reg bit_counter_and_register_reset_o
);

localparam  STATE_IDLE		= 0,
          STATE_ADDING		= 1;

reg state, nextstate;

// Mealy Outputs
always @(*) begin
bit_counter_and_register_reset_o = 1'b0;
  done_o = 1'b0;
  nextstate = state;

  if (state == STATE_IDLE) begin
    if (new_hash_ready_i) begin
      bit_counter_and_register_reset_o = 1'b1;
      nextstate = STATE_ADDING;
    end
  end else begin // state == STATE_ADDING
    if (bit_counter_done_i) begin
      done_o = 1'b1;
      nextstate = STATE_IDLE;
    end
  end
end

// Moore Outputs
always @(*) begin
  if (state == STATE_ADDING)
    shift_add_and_decrement_o = 1'b1;
  else
    shift_add_and_decrement_o = 1'b0;
end

always @(posedge clk_i)
  state <= nextstate;

endmodule
