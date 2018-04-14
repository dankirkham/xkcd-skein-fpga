module best_nonce_module (
  input clk_i,
  input rst_i,
  input save_selection_i,
  input [23:0] main_bus_i,
  input reset_best_nonce_i,

  input [15:0] ram_i,
  output reg [15:0] ram_o,
  output reg [3:0] ram_address_o,
  output reg ram_write_o
);

reg [3:0] state, nextstate;

reg register_write_w;
wire [23:0] register_from_w;

localparam IDLE                        = 0,
           BITS_OFF                    = 1,
           SAVE_HIGH_BEST_COREID_BYTE  = 2,
           SAVE_LOW_BEST_COREID_BYTE   = 3,
           WAIT                        = 4,
           RECEIVE_NONCE               = 5;

localparam NONCE_LENGTH = 8;

localparam RAM_ADDRESS_NEW_CORE_ID_LOW_WORD = 4'hB;
localparam RAM_ADDRESS_BEST_CORE_ID_LOW_WORD = 4'h8;
localparam RAM_ADDRESS_BEST_CORE_ID_HIGH_WORD = 4'h9;
localparam RAM_ADDRESS_BEST_BITS_OFF = 4'hA;
localparam RAM_ADDRESS_NONCE = 4'h0;

best_nonce_module_register best_nonce_module_register0 (
  .clk_i(clk_i),
  .write_i(register_write_w),
  .input_i(main_bus_i),
  .output_o(register_from_w)
);

always @(*) begin
  // ram_address_o = 4'bxxxx;
  // ram_o = 16'bxxxxxxxxxxxxxxxx;
  ram_write_o = 1'b0;
  register_write_w = 1'b0;

  if (rst_i) nextstate = IDLE;

  case(state)
    IDLE:
      if (reset_best_nonce_i) begin
        ram_address_o = RAM_ADDRESS_BEST_BITS_OFF;
        ram_o = 16'd1023;
        ram_write_o = 1'b1;

        nextstate = IDLE;
      end else if (save_selection_i) begin
        ram_address_o = RAM_ADDRESS_BEST_BITS_OFF;
        register_write_w = 1'b1;

        nextstate = BITS_OFF;
      end else begin
        nextstate = IDLE;
      end
    BITS_OFF:
      if (main_bus_i[15:0] < ram_i) begin
        // Nonce is better, save it
        ram_address_o = RAM_ADDRESS_BEST_BITS_OFF;
        ram_write_o = 1'b1;
        ram_o = main_bus_i[15:0];

        nextstate = SAVE_HIGH_BEST_COREID_BYTE;
      end else begin
        nextstate = IDLE;
      end
    SAVE_HIGH_BEST_COREID_BYTE:
      begin
        ram_address_o = RAM_ADDRESS_BEST_CORE_ID_HIGH_WORD;
        ram_write_o = 1'b1;
        ram_o = { 8'd0, register_from_w[23:16] };

        nextstate = SAVE_LOW_BEST_COREID_BYTE;
      end
    SAVE_LOW_BEST_COREID_BYTE:
      begin
        ram_address_o = RAM_ADDRESS_BEST_CORE_ID_LOW_WORD;
        ram_write_o = 1'b1;
        ram_o = register_from_w[15:0];

        nextstate = WAIT;
      end
    WAIT:
      begin
        nextstate = RECEIVE_NONCE;
      end
    default: // RECEIVE_NONCE
      if (state < RECEIVE_NONCE + NONCE_LENGTH) begin
        ram_address_o = state - RECEIVE_NONCE;
        ram_o = main_bus_i[15:0];
        ram_write_o = 1'b1;

        nextstate = state + 4'd1;
      end else begin
        nextstate = IDLE;
      end
  endcase
end

always @(posedge clk_i) begin
  state <= nextstate;
end

endmodule
