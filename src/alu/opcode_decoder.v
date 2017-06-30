module opcode_decoder (
  input [3:0] opcode_i,

  output [2:0] primary_register_control_o,
  output [1:0] secondary_register_control_o,
  output [1:0] bit_counter_register_control_o,
  output comparator_register_control_o,
  output comparator_demux_control_o,
  output passthrough_demux_control_o,
  output [1:0] output_demux_control_o,
  output input_demux_control_o
);

reg [12:0] control_lines;

assign primary_register_control_o = control_lines[12:10];
assign secondary_register_control_o = control_lines[9:8];
assign bit_counter_register_control_o = control_lines[7:6];
assign comparator_register_control_o = control_lines[5];
assign comparator_demux_control_o = control_lines[4];
assign passthrough_demux_control_o = control_lines[3];
assign output_demux_control_o = control_lines[2:1];
assign input_demux_control_o = control_lines[0];

always @(*) begin
  case (opcode_i)
    4'h0: control_lines = 13'b1110000000000; // Write Primary Register
    4'h1: control_lines = 13'b1100000000000; // Write Primary Register Lower 16-bits
    4'h2: control_lines = 13'b0100000001010; // Rotate Primary Register Left 16-bits
    4'h3: control_lines = 13'b0010001010000; // Rotate Primary Register Left 1-bit and Increment Bit Counter
    4'h4: control_lines = 13'b0001100000000; // Write Secondary Register
    4'h5: control_lines = 13'b0001000000000; // Write Secondary Register Lower 16-bits
    4'h6: control_lines = 13'b0000100000000; // Rotate Secondary Register Left 16-bits
    4'h7: control_lines = 13'b1110000000101; // XOR
    4'h8: control_lines = 13'b1110000000111; // Add
    4'h9: control_lines = 13'b0000010000000; // Write Bit Counter
    4'hA: control_lines = 13'b0000000100000; // Write Comparator Register & Compare
    4'hB: control_lines = 13'b0000000000010; // Comparator Nonce Pass-through
    4'hD: control_lines = 13'b0000000010000; // Bit Counter Pass-through
    4'hE: control_lines = 13'b0000000000000; // Compare
    default: control_lines = 13'b0000000001010; // Primary Register Pass-through, 0xC
  endcase
end

endmodule
