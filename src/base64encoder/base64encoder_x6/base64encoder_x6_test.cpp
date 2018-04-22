#include <iostream>
#include <fstream>
#include <string>

#include "Vbase64encoder_x6.h"
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

  Vbase64encoder_x6* top = new Vbase64encoder_x6;

  top->input_i = 0xDEADBEEFFEED;
  top->eval();
  _assert("0xDEADBEEFFEED input should be '3q2+7/7t' (0x3371322b372f3774)", top->output_o == 0x3371322b372f3774);

  delete top;

  _report(argv[0]);

  exit(0);
}
