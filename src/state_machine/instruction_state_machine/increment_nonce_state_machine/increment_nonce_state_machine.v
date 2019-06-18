module increment_nonce_state_machine (
  input start_i,
  output reg [20:0] instruction_o,
  output done_o
);

wire [20:0] instruction_w;

assign instruction_w = { 1'b0, 1'b0, 8'b0, 2'b00, 1'b0, 1'b0, 4'h0, 3'd1 };
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

assign done_o = start_i;

always @(*) begin
  if (start_i)
    instruction_o = instruction_w;
  else
    instruction_o = 21'bZ;
end

endmodule
