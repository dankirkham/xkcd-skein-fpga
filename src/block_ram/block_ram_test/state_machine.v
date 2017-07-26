module state_machine (
  input clk_i,
  input new_rx_data_i,
  input [7:0] rx_data_i,
  input tx_busy_i,
  input timeout_timer_timed_out_i,
  input [7:0] header_byte_i,

  // Mealy Outputs
  output reg timeout_timer_reset_o,
  output reg address_register_write_o,
  output reg data_register_write_low_o,
  output reg data_register_write_high_o,
  output reg new_tx_data_o,

  // Moore Outputs
  output reg write_o,
  output reg data_register_demux_o,
  output reg byte_select_demux_o,
  output reg transmitter_demux_o
);

reg [3:0] state, nextstate;

localparam READY                  = 0,
           RECEIVE_ADDRESS_BYTE   = 1,
           RECEIVE_RW_BYTE        = 2,
           RECEIVE_LOW_DATA_BYTE  = 3,
           RECEIVE_HIGH_DATA_BYTE = 4,
           WRITE_RAM              = 5,
           READ_RAM               = 6,
           SEND_HEADER            = 7,
           SEND_LOW_DATA_BYTE     = 8,
           SEND_HIGH_DATA_BYTE    = 9;

always @(*) begin // Mealy Outputs and nextstate
  timeout_timer_reset_o = 1'b0;
  address_register_write_o = 1'b0;
  data_register_write_low_o = 1'b0;
  data_register_write_high_o = 1'b0;
  new_tx_data_o = 1'b0;

  case(state)
    READY:
      if (new_rx_data_i & (rx_data_i == header_byte_i)) begin
        timeout_timer_reset_o = 1'b1;
        nextstate = RECEIVE_ADDRESS_BYTE;
      end else begin
        nextstate = READY;
      end

    RECEIVE_ADDRESS_BYTE:
      if (timeout_timer_timed_out_i) begin
        nextstate = READY;
      end else begin
        if (new_rx_data_i) begin
          address_register_write_o = 1'b1;
          nextstate = RECEIVE_RW_BYTE;
        end else begin
          nextstate = RECEIVE_ADDRESS_BYTE;
        end
      end

    RECEIVE_RW_BYTE:
      if (timeout_timer_timed_out_i) begin
        nextstate = READY;
      end else begin
        if (new_rx_data_i) begin
          if (rx_data_i == 8'd0) begin
            nextstate = READ_RAM;
          end else begin
            nextstate = RECEIVE_LOW_DATA_BYTE;
          end
        end else begin
          nextstate = RECEIVE_RW_BYTE;
        end
      end

    RECEIVE_LOW_DATA_BYTE:
      if (timeout_timer_timed_out_i) begin
        nextstate = READY;
      end else begin
        if (new_rx_data_i) begin
          data_register_write_low_o = 1'b1;
          nextstate = RECEIVE_HIGH_DATA_BYTE;
        end else begin
          nextstate = RECEIVE_LOW_DATA_BYTE;
        end
      end

    RECEIVE_HIGH_DATA_BYTE:
      if (timeout_timer_timed_out_i) begin
        nextstate = READY;
      end else begin
        if (new_rx_data_i) begin
          data_register_write_high_o = 1'b1;
          nextstate = WRITE_RAM;
        end else begin
          nextstate = RECEIVE_HIGH_DATA_BYTE;
        end
      end

    WRITE_RAM:
      nextstate = READY;

    READ_RAM:
    begin
      data_register_write_low_o = 1'b1;
      data_register_write_high_o = 1'b1;
      nextstate = SEND_HEADER;
    end

    SEND_HEADER:
      if (tx_busy_i) begin
        nextstate = SEND_HEADER;
      end else begin
        new_tx_data_o = 1'b1;
        nextstate = SEND_LOW_DATA_BYTE;
      end

    SEND_LOW_DATA_BYTE:
      if (tx_busy_i) begin
        nextstate = SEND_LOW_DATA_BYTE;
      end else begin
        new_tx_data_o = 1'b1;
        nextstate = SEND_HIGH_DATA_BYTE;
      end

    SEND_HIGH_DATA_BYTE:
      if (tx_busy_i) begin
        nextstate = SEND_HIGH_DATA_BYTE;
      end else begin
        new_tx_data_o = 1'b1;
        nextstate = READY;
      end
  endcase
end

always @(*) begin // Moore Outputs
  write_o = 1'b0;
  data_register_demux_o = 1'b0;
  byte_select_demux_o = 1'b0;
  transmitter_demux_o = 1'b0;

  case(state)
    RECEIVE_LOW_DATA_BYTE:
    begin
      data_register_demux_o = 1'b0;
    end

    RECEIVE_HIGH_DATA_BYTE:
    begin
      data_register_demux_o = 1'b0;
    end

    WRITE_RAM:
    begin
      write_o = 1'b1;
    end

    READ_RAM:
    begin
      data_register_demux_o = 1'b1;
    end

    SEND_HEADER:
    begin
      transmitter_demux_o = 1'b1;
    end

    SEND_LOW_DATA_BYTE:
    begin
      transmitter_demux_o = 1'b0;
      byte_select_demux_o = 1'b0;
    end

    SEND_HIGH_DATA_BYTE:
    begin
      transmitter_demux_o = 1'b0;
      byte_select_demux_o = 1'b1;
    end
  endcase
end

always @(posedge clk_i) begin
  state <= nextstate;
end

endmodule
