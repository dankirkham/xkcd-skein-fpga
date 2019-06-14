module read_state_machine (
  input clk_i,
  input rst_i,
  input [7:0] address_i, // Parameter 1
  input start_i,
  output reg [20:0] instruction_o,
  output reg done_o
);

wire [7:0] address_w;
wire output_select_w;
wire output_enable_w;

wire [20:0] instruction_w;

assign instruction_w = {
    1'b0, // save_core_selection
    1'b0, // ram_write_bit
    address_w, // address
    1'b0, // input_select
    output_select_w, // output_select
    output_enable_w, // output_enable
    4'hC, // alu_opcode
    3'd0, // global_command
};

localparam STATE_IDLE = 0;
localparam STATE_DONE = 4;

reg [2:0] state, nextstate;

always @(*) begin
  case (state_q) begin
    STATE_IDLE: begin
      address_w = { address_i[5:0], 2'd0 };
      output_select_w = 1'b0;
      output_enable_w = 1'b0;
      done_o = 1'b0;

      if (start_i) begin
        instruction_o = instruction_w;
        nextstate = state + 3'b1;
      end else begin
        instruction_o = 21'bZ;
        nextstate = state;
      end
    end
    1: begin
      address_w = { address_i[5:0], 2'd1 };
      output_select_w = 1'b1;
      output_enable_w = 1'b1;
      done_o = 1'b0;

      instruction_o = instruction_w;
      nextstate = state + 3'b1;
    end
    2: begin
      address_w = { address_i[5:0], 2'd2 };
      output_select_w = 1'b1;
      output_enable_w = 1'b1;
      done_o = 1'b0;

      instruction_o = instruction_w;
      nextstate = state + 3'b1;
    end
    STATE_DONE: begin
      address_w = { address_i[5:0], 2'd3 };
      output_select_w = 1'b1;
      output_enable_w = 1'b1;
      done_o = 1'b1;

      instruction_o = instruction_w;
      nextstate = STATE_IDLE;
    end
  end
end

always @(posedge clk_i) begin
  if (rst_i)
    state <= STATE_IDLE;
  else
    state <= nextstate;
end

endmodule
