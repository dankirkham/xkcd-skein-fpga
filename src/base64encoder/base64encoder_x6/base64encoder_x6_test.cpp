#include <iostream>
#include <string>

#include "Vbase64encoder_x6.h"
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

  Vbase64encoder_x6* top = new Vbase64encoder_x6;

  top->input_i = 0xDEADBEEFFEED;
  top->eval();
  _assert("0xDEADBEEFFEED input should be '3q2+7/7t' (0x3371322b372f3774)", top->output_o == 0x3371322b372f3774);

  delete top;

  exit(0);
}
