#include <iostream>
#include <fstream>
#include <string>

#include "Vbase64encoder.h"
#include "verilated.h"
#include "test.h"

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Test test = Test(argv[0]);

  Vbase64encoder* top = new Vbase64encoder;

  top->input_i = 19;
  top->eval();
  test.check("19 input should be 'T'", top->output_o == 'T');

  top->input_i = 0;
  top->eval();
  test.check("0 input should be 'A'", top->output_o == 'A');

  top->input_i = 63;
  top->eval();
  test.check("63 input should be '/'", top->output_o == '/');

  top->input_i = 62;
  top->eval();
  test.check("62 input should be '+'", top->output_o == '+');

  top->input_i = 34;
  top->eval();
  test.check("34 input should be 'i'", top->output_o == 'i');

  top->input_i = 57;
  top->eval();
  test.check("57 input should be '5'", top->output_o == '5');

  delete top;

  test.report();

  exit(0);
}
