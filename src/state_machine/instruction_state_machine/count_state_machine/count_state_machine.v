module count_state_machine (
  input clk_i,
  input rst_i,
  input start_i,
  output reg [20:0] instruction_o,
  output reg done_o
);

wire [20:0] instruction_w;

assign instruction_w = { 2'b0, 8'b0, 2'b0, 1'b0, 1'b0, 4'h3, 3'd0 };
// assign instruction_w = {
//     1'b0, // save_core_selection
//     1'b0, // ram_write_bit
//     address_w, // address
//     2'b0, // input_select
//     output_select_w, // output_select
//     output_enable_w, // output_enable
//     4'hC, // alu_opcode
//     3'd0, // global_command
// };

localparam STATE_IDLE = 0;
localparam STATE_DONE = 63;

reg [5:0] state, nextstate;

always @(*) begin
  if (state != STATE_IDLE || start_i == 1'b1)
    instruction_o = instruction_w;
  else
    instruction_o = 21'bZ;
end

always @(*) begin
  if (state == STATE_DONE)
    done_o = 1'b1;
  else
    done_o = 1'b0;
end

always @(*) begin
  if (state == STATE_IDLE) begin
    if (start_i) begin
      nextstate = state + 6'b1;
    end else begin
      nextstate = state;
    end
  end else if (state == STATE_DONE) begin
    nextstate = STATE_IDLE;
  end else begin
    nextstate = state + 6'b1;
  end
end

always @(posedge clk_i) begin
  if (rst_i)
    state <= STATE_IDLE;
  else
    state <= nextstate;
end

endmodule
