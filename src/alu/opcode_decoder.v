module opcode_decoder (
  input [3:0] opcode_i,

  output [2:0] primary_register_control_o,
  output [1:0] secondary_register_control_o,
  output [1:0] bit_counter_register_control_o,
  output comparator_register_control_o,
  output comparator_demux_control_o,
  output passthrough_demux_control_o,
  output [1:0] output_demux_control_o
);

reg [11:0] control_lines;

assign primary_register_control_o = control_lines[11:9];
assign secondary_register_control_o = control_lines[8:7];
assign bit_counter_register_control_o = control_lines[6:5];
assign comparator_register_control_o = control_lines[4];
assign comparator_demux_control_o = control_lines[3];
assign passthrough_demux_control_o = control_lines[2];
assign output_demux_control_o = control_lines[1:0];

always @(*) begin
  case (opcode_i)
    4'h0: control_lines = 12'b111000000000; // Write Primary Register
    4'h1: control_lines = 12'b110000000000; // Write Primary Register Lower 16-bits
    4'h2: control_lines = 12'b010000000000; // Rotate Primary Register Left 16-bits
    4'h3: control_lines = 12'b001000101000; // Rotate Primary Register Left 1-bit and Increment Bit Counter
    4'h4: control_lines = 12'b000110000000; // Write Secondary Register
    4'h5: control_lines = 12'b000100000000; // Write Secondary Register Lower 16-bits
    4'h6: control_lines = 12'b000010000000; // Rotate Secondary Register Left 16-bits
    4'h8: control_lines = 12'b000000000011; // Add
    4'h9: control_lines = 12'b000001000000; // Write Bit Counter
    4'hA: control_lines = 12'b000000010000; // Write Comparator Register & Compare
    4'hB: control_lines = 12'b000000000001; // Comparator Nonce Pass-through
    4'hC: control_lines = 12'b000000000101; // Primary Register Pass-through
    4'hD: control_lines = 12'b000000001000; // Bit Counter Pass-through
    4'hE: control_lines = 12'b000000000000; // Compare
    default: control_lines = 12'b000000000010; // XOR, 0x7
  endcase
end

endmodule
