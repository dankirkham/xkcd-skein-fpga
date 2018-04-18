module global_command_decoder (
  input [2:0] global_command_i,
  output reg increment_nonce_o,
  output reg best_nonce_module_save_selection_o,
  output reg transmit_o,
  output reg constants_rom_ouput_enable_o,
  output reg nonce_module_ouput_enable_o
);

always @(*) begin
  increment_nonce_o = 1'b0;
  best_nonce_module_save_selection_o = 1'b0;
  transmit_o = 1'b0;
  constants_rom_ouput_enable_o = 1'b0;
  nonce_module_ouput_enable_o = 1'b0;

  case (global_command_i)
    1:
      increment_nonce_o = 1'b1;
    2:
      best_nonce_module_save_selection_o = 1'b1;
    3:
      transmit_o = 1'b1;
    4:
      constants_rom_ouput_enable_o = 1'b1;
    5:
      nonce_module_ouput_enable_o = 1'b1;
  endcase
end

endmodule
