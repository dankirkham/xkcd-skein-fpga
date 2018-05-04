#include <iostream>
#include <fstream>
#include <string>

#include "Vconstants_rom.h"
#include "verilated.h"
#include "test.h"

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Test test = Test(argv[0]);

  Vconstants_rom* top = new Vconstants_rom;

  top->address_i = 0x18;
  top->output_enable_i = 0;
  test.check("Key Extend Word is not output", top->constant_o != 0x1BD11BDAA9FC1A22);

  top->address_i = 0x18;
  top->output_enable_i = 1;
  top->eval();
  test.check("Key Extend Word is output", top->constant_o == 0x1BD11BDAA9FC1A22);

  top->address_i = 0x19;
  top->output_enable_i = 1;
  top->eval();

  top->address_i = 0x18;
  top->output_enable_i = 0;
  top->eval();
  test.check("Key Extend Word is not output", top->constant_o != 0x1BD11BDAA9FC1A22);

  delete top;

  test.report();

  exit(0);
}
