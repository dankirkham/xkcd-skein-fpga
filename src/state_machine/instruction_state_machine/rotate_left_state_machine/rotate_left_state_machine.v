module rotate_left_state_machine (
  input clk_i,
  input rst_i,
  input [5:0] bits_i, // Parameter 1
  input [5:0] address_i, // Parameter 2
  input start_i,
  output reg [20:0] instruction_o,
  output reg done_o
);

wire [7:0] address_w;
wire ram_write_w;
wire [3:0] alu_opcode_w;

wire [20:0] instruction_w;

assign instruction_w = { 1'b0, ram_write_w, address_w, 2'b0, 1'b0, 1'b0, alu_opcode_w, 3'd0 };
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
localparam STATE_FIRST_ROTATE_16 = 1;
localparam STATE_SECOND_ROTATE_16 = 2;
localparam STATE_THIRD_ROTATE_16 = 3;
localparam STATE_DONE = 4;
localparam STATE_ROTATE_FIFTEEN_TIMES = 5;
localparam STATE_ROTATE_SINGLE_DONE = 18;

reg [4:0] state, nextstate;

always @(*) begin
  if (state != STATE_IDLE || start_i == 1'b1)
    instruction_o = instruction_w;
  else
    instruction_o = 21'bZ;
end

always @(*) begin
  if (state == STATE_IDLE) begin
    done_o = 1'b0;

    if (start_i) begin
      if (bits_i[3:0] == 4'd0) begin
        address_w = { address_i[5:0], bits_i[5:4] };
        ram_write_w = 1'b1;
        alu_opcode_w = 4'h2;
        nextstate = STATE_SECOND_ROTATE_16;
      end else if (bits_i[3:0] == 4'd1) begin
        address_w = 8'b0;
        ram_write_w = 1'b0;
        alu_opcode_w = 4'h3;
        nextstate = STATE_FIRST_ROTATE_16;
      end else begin
        address_w = 8'b0;
        ram_write_w = 1'b0;
        alu_opcode_w = 4'h3;
        nextstate = 5'd15 - { 1'd0, bits_i[3:0] } + STATE_ROTATE_FIFTEEN_TIMES;
      end
    end else begin
      address_w = 8'b0;
      ram_write_w = 1'b0;
      alu_opcode_w = 4'hC;
      nextstate = state;
    end
  end else if (state == STATE_FIRST_ROTATE_16) begin
    done_o = 1'b0;
    address_w = { address_i[5:0], bits_i[5:4] };
    ram_write_w = 1'b1;
    alu_opcode_w = 4'h2;
    nextstate = STATE_SECOND_ROTATE_16;
  end else if (state == STATE_SECOND_ROTATE_16) begin
    done_o = 1'b0;
    address_w = { address_i[5:0], 2'd3 + bits_i[5:4] };
    ram_write_w = 1'b1;
    alu_opcode_w = 4'h2;
    nextstate = STATE_THIRD_ROTATE_16;
  end else if (state == STATE_THIRD_ROTATE_16) begin
    done_o = 1'b0;
    address_w = { address_i[5:0], 2'd2 + bits_i[5:4] };
    ram_write_w = 1'b1;
    alu_opcode_w = 4'h2;
    nextstate = STATE_DONE;
  end else if (state == STATE_DONE) begin
    done_o = 1'b1;
    address_w = { address_i[5:0], 2'd1 + bits_i[5:4] };
    ram_write_w = 1'b1;
    alu_opcode_w = 4'h2;
    nextstate = STATE_IDLE;
  end else if (state == STATE_ROTATE_SINGLE_DONE) begin
    done_o = 1'b0;
    address_w = 8'b0;
    ram_write_w = 1'b0;
    alu_opcode_w = 4'h3;
    nextstate = STATE_FIRST_ROTATE_16;
  end else begin
    done_o = 1'b0;
    address_w = 8'b0;
    ram_write_w = 1'b0;
    alu_opcode_w = 4'h3;
    nextstate = state + 5'd1;
  end
end

always @(posedge clk_i) begin
  if (rst_i)
    state <= STATE_IDLE;
  else
    state <= nextstate;
end

endmodule
