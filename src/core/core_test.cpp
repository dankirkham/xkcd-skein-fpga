#include <iostream>
#include <fstream>
#include <string>

#include "Vcore.h"
#include "verilated.h"
#include "test.h"

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Test test = Test(argv[0]);

  Vcore* top = new Vcore;

  top->clk_i = 0;
  top->eval();

  // Write value to Primary Register
  top->input_i = 0xDEADBEEF;
  top->input_select_i = 0;
  top->alu_opcode_i = 0x0;
  top->output_enable_i = 0;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Output should not be enabled", top->output_o != 0xDEADBEEF);

  // Output Primary Register
  top->input_i = 0;
  top->alu_opcode_i = 0xC;
  top->output_select_i = 0;
  top->output_enable_i = 1;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Output should not be valid", top->output_o != 0xDEADBEEF);

  // Select the Core
  top->input_i = 42;
  top->input_select_i = 0x2;
  top->save_selection_i = 1;
  top->alu_opcode_i = 0xC;
  top->output_select_i = 0;
  top->output_enable_i = 0;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Output should not be enabled", top->output_o != 0xDEADBEEF);

  // Output Primary Register
  top->input_i = 0;
  top->input_select_i = 0;
  top->alu_opcode_i = 0xC;
  top->save_selection_i = 0;
  top->output_select_i = 0;
  top->output_enable_i = 1;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Output should be enabled and valid", top->output_o == 0xDEADBEEF);

  // Pass Through RAM Value
  top->output_select_i = 1;
  top->output_enable_i = 1;
  top->input_i = 0;
  top->ram_i = 0xFACE;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Output should be RAM input", top->output_o == 0xFACE);

  // Save RAM value to secondary register
  top->output_select_i = 0;
  top->output_enable_i = 0;
  top->input_i = 0;
  top->input_select_i = 1;
  top->ram_i = 0xFACE;
  top->alu_opcode_i = 0x4;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  // XOR Primary and Secondary Register
  top->output_select_i = 0;
  top->output_enable_i = 1;
  top->input_i = 0;
  top->ram_i = 0;
  top->alu_opcode_i = 0x7;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Output should be XOR of Primary and Secondary Register", top->output_o == (0xDEADBEEF ^ 0xFACE));

  // Output Primary Register
  top->input_i = 0;
  top->alu_opcode_i = 0xC;
  top->output_select_i = 0;
  top->output_enable_i = 1;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Output should be XOR of Primary and Secondary Register", top->output_o == (0xDEADBEEF ^ 0xFACE));

  delete top;

  test.report();

  exit(0);
}
