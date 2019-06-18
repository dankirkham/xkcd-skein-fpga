#include <iostream>
#include <fstream>
#include <string>

#include "Vnonce_state_machine.h"
#include "verilated.h"
#include "test.h"

struct Instruction {
  int save_core_selection;
  int ram_write_bit;
  int address;
  int input_select;
  int output_select;
  int output_enable;
  int alu_opcode;
  int global_command;
};

Instruction decode_instruction(int i) {
  Instruction instruction;

  instruction.save_core_selection = (i >> 20) & 0x1;
  instruction.ram_write_bit = (i >> 19) & 0x1;
  instruction.address = (i >> 11) & 0xFF;
  instruction.input_select = (i >> 9) & 0x3;
  instruction.output_select = (i >> 8) & 0x1;
  instruction.output_enable = (i >> 7) & 0x1;
  instruction.alu_opcode = (i >> 3) & 0xF;
  instruction.global_command = (i >> 0) & 0x7;

  return instruction;
}

int main(int argc, char **argv, char **env) {
  Instruction i;

  Verilated::commandArgs(argc, argv);
  Test test = Test(argv[0]);

  Vnonce_state_machine* top = new Vnonce_state_machine;
  top->start_i = 0;
  top->address_i = 37;
  top->eval();

  test.check("Nothing is output", top->instruction_o == 0);
  test.check("Not done", top->done_o == 0);

  top->start_i = 1;
  top->eval();
  i = decode_instruction(top->instruction_o);
  test.check("save_core_selection is 0", i.save_core_selection == 0);
  test.check("ram_write_bit is 0", i.ram_write_bit == 0);
  test.check("address is 37", i.address == 37);
  test.check("input_select is 0", i.input_select == 0);
  test.check("output_select is 0", i.output_select == 0);
  test.check("output_enable is 0", i.output_enable == 0);
  test.check("alu_opcode is 0x0", i.alu_opcode == 0x0);
  test.check("global_command is 5", i.global_command == 5);
  test.check("Done", top->done_o == 1);

  top->start_i = 0;
  top->eval();
  test.check("Nothing is output", top->instruction_o == 0);
  test.check("Not done", top->done_o == 0);

  delete top;

  test.report();

  exit(0);
}
