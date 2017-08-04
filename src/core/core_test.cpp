#include <iostream>
#include <string>

#include "Vcore.h"
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

  Vcore* top = new Vcore;

  top->clk_i = 0;
  top->eval();

  // Write value to Primary Register

  delete top;

  exit(0);
}
