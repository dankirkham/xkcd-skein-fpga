module serial_transmitter_state_machine (
  input clk_i,
  input transmit_i,
  output reg new_tx_data_o,
  output reg [7:0] tx_byte_o,
  input tx_busy_i,
  input [7:0] ram_i,
  output reg address_reset_o,
  output reg address_increment_o,
  input [4:0] address_i,
  input [7:0] header_byte_i,
  input [7:0] status_byte_i,
  output reg reset_best_nonce_module_o
);

reg [1:0] state, nextstate;

localparam IDLE             = 0,
           SEND_HEADER      = 1,
           SEND_STATUS_BYTE = 2,
           SEND_DATA        = 3;

localparam DATA_LENGTH = 22;

always @(*) begin
  new_tx_data_o = 1'b0;
  tx_byte_o = 8'bxxxxxxxx;
  address_reset_o = 1'b0;
  address_increment_o = 1'b0;
  reset_best_nonce_module_o = 1'b0;

  case (state)
    IDLE:
      if (transmit_i)
        nextstate = SEND_HEADER;
      else
        nextstate = IDLE;

    SEND_HEADER:
      if (tx_busy_i)
        nextstate = SEND_HEADER;
      else begin
        tx_byte_o = header_byte_i;
        new_tx_data_o = 1'b1;
        nextstate = SEND_STATUS_BYTE;
      end

    SEND_STATUS_BYTE:
      if (tx_busy_i)
        nextstate = SEND_STATUS_BYTE;
      else begin
        tx_byte_o = status_byte_i;
        new_tx_data_o = 1'b1;
        nextstate = SEND_DATA;
        address_reset_o = 1'b1;
      end

    SEND_DATA:
      if (address_i == DATA_LENGTH) begin
        reset_best_nonce_module_o = 1'b1;

        nextstate = IDLE;
      end else begin
        if (~tx_busy_i) begin
          address_increment_o = 1'b1;
          tx_byte_o = ram_i;
          new_tx_data_o = 1'b1;
        end

        nextstate = SEND_DATA;
      end
  endcase
end

always @(posedge clk_i) begin
  state <= nextstate;
end

endmodule
