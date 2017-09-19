module serial_receiver_state_machine (
  input clk_i,

  input new_rx_data_i,
  input [7:0] rx_data_i,
  input [7:0] header_byte_i,
  input [3:0] nonce_counter_i,
  input timeout_timer_timed_out_i,

  // Mealy Outputs
  output reg timeout_timer_reset_o,
  output reg nonce_counter_zero_o,
  output reg nonce_counter_increment_and_shift_in_o,
  output reg nonce_ready_o,
  output reg nonce_ready_set_o
);

reg [1:0] state, nextstate;

localparam INITIALIZATION     = 0,
           READY              = 1,
           RECEIVE_NONCE_BYTE = 2;

localparam NONCE_LENGTH = 12;

always @(*) begin // Mealy Outputs and nextstate
  timeout_timer_reset_o = 1'b0;
  nonce_counter_zero_o = 1'b0;
  nonce_counter_increment_and_shift_in_o = 1'b0;
  nonce_ready_o = 1'b0;
  nonce_ready_set_o = 1'b0;

  case(state)
    INITIALIZATION:
      begin
        nonce_ready_o = 1'b0;
        nonce_ready_set_o = 1'b1;
        nextstate = READY;
      end

    READY:
      if (new_rx_data_i & (rx_data_i == header_byte_i)) begin
        timeout_timer_reset_o = 1'b1;
        nonce_counter_zero_o = 1'b1;
        nonce_ready_o = 1'b0;
        nonce_ready_set_o = 1'b1;
        nextstate = RECEIVE_NONCE_BYTE;
      end else begin
        nextstate = READY;
      end

    RECEIVE_NONCE_BYTE:
      if (timeout_timer_timed_out_i) begin
        nextstate = READY;
      end else begin
        if (nonce_counter_i == NONCE_LENGTH) begin
          nonce_ready_o = 1'b1;
          nonce_ready_set_o = 1'b1;
          nextstate = READY;
        end else begin
          if (new_rx_data_i) begin
            nonce_counter_increment_and_shift_in_o = 1'b1;
          end

          nextstate = RECEIVE_NONCE_BYTE;
        end
      end
  endcase
end

always @(posedge clk_i) begin
  state <= nextstate;
end

endmodule
