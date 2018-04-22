#include <iostream>
#include <fstream>
#include <string>

#include "Vconstants_rom.h"
#include "verilated.h"

int tests = 0;
int failures = 0;

void _assert(std::string assertation, bool condition) {
  tests++;
  cout << assertation << ": ";
  if (condition) {
    cout << "\033[1;35mPass!\033[0m" << endl;
  } else {
    cout << "\033[1;31mFail!\033[0m" << endl;
    failures++;
  }
}

void _report(std::string name) {
  ofstream output_file;
  output_file.open(name + ".txt");
  output_file << name << ": " << std::to_string(tests) << " assertions; " << std::to_string(tests - failures) << " passed; " << std::to_string(failures) << " failed.\n";
  output_file.close();
}

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);

  Vconstants_rom* top = new Vconstants_rom;

  top->address_i = 0x18;
  top->output_enable_i = 0;
  cout << top->constant_o << endl;
  _assert("Key Extend Word is not output", top->constant_o != 0x1BD11BDAA9FC1A22);

  top->address_i = 0x18;
  top->output_enable_i = 1;
  top->eval();
  _assert("Key Extend Word is output", top->constant_o == 0x1BD11BDAA9FC1A22);

  top->address_i = 0x19;
  top->output_enable_i = 1;
  top->eval();

  top->address_i = 0x18;
  top->output_enable_i = 0;
  top->eval();
  _assert("Key Extend Word is not output", top->constant_o != 0x1BD11BDAA9FC1A22);

  delete top;

  _report(argv[0]);

  exit(0);
}
