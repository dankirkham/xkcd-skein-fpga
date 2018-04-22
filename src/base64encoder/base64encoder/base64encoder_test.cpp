#include <iostream>
#include <fstream>
#include <string>

#include "Vbase64encoder.h"
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

  Vbase64encoder* top = new Vbase64encoder;

  top->input_i = 19;
  top->eval();
  _assert("19 input should be 'T'", top->output_o == 'T');

  top->input_i = 0;
  top->eval();
  _assert("0 input should be 'A'", top->output_o == 'A');

  top->input_i = 63;
  top->eval();
  _assert("63 input should be '/'", top->output_o == '/');

  top->input_i = 62;
  top->eval();
  _assert("62 input should be '+'", top->output_o == '+');

  top->input_i = 34;
  top->eval();
  _assert("34 input should be 'i'", top->output_o == 'i');

  top->input_i = 57;
  top->eval();
  _assert("57 input should be '5'", top->output_o == '5');

  delete top;

  _report(argv[0]);

  exit(0);
}
