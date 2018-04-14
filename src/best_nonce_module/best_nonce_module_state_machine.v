module best_nonce_module_state_machine (
  input clk_i,
  input save_selection_i,
  input [23:0] main_bus_i,

  input [15:0] ram_i,
  output reg [15:0] ram_o,
  output reg [3:0] ram_address_o,
  output reg ram_write_o
);

reg [2:0] state, nextstate;

localparam IDLE                        = 0,
           BITS_OFF                    = 1,
           SAVE_HIGH_COREID_BYTE       = 2,
           LOAD_BEST_CORE_ID_LOW_WORD  = 3,
           SAVE_BEST_CORE_ID_HIGH_WORD = 4,
           RECEIVE_NONCE               = 5;

localparam NONCE_LENGTH = 8;

localparam RAM_ADDRESS_NEW_CORE_ID_LOW_WORD = 4'hB;
localparam RAM_ADDRESS_BEST_CORE_ID_LOW_WORD = 4'h8;
localparam RAM_ADDRESS_BEST_CORE_ID_HIGH_WORD = 4'h9;
localparam RAM_ADDRESS_BEST_BITS_OFF = 4'hA;
localparam RAM_ADDRESS_NONCE = 4'h0;

always @(*) begin
  ram_address_o = 4'bxxxx;
  ram_o = 16'bxxxxxxxxxxxxxxxx;
  ram_write_o = 1'b0;

  case(state)
    IDLE:
      if (save_selection_i) begin

      end else begin
        nextstate = IDLE;
      end
  endcase
end

always @(posedge clk_i) begin
  state <= nextstate;
end

endmodule
