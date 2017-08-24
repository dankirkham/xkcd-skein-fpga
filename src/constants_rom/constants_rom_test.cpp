#include <iostream>
#include <string>

#include "Vconstants_rom.h"
#include "verilated.h"

void _assert(std::string assertation, bool condition) {
  cout << assertation << ": ";
  if (condition) {
    cout << "\033[1;35mPass!\033[0m" << endl;
  } else {
    cout << "\033[1;31mFail!\033[0m" << endl;
  }
}

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);

  Vconstants_rom* top = new Vconstants_rom;

  top->address_i = 0x18;
  top->output_enable_i = 1;
  top->eval();
  _assert("Key Extend Word is output", top->constant_o == 0x1BD11BDAA9FC1A22);

  top->address_i = 0x18;
  top->output_enable_i = 0;
  top->eval();
  _assert("Key Extend Word is not output", top->constant_o != 0x1BD11BDAA9FC1A22);

  delete top;

  exit(0);
}
