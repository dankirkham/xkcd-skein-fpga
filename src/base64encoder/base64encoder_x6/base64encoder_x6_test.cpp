#include <iostream>
#include <fstream>
#include <string>

#include "Vbase64encoder_x6.h"
#include "verilated.h"
#include "test.h"

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Test test = test(argv[0]);

  Vbase64encoder_x6* top = new Vbase64encoder_x6;

  top->input_i = 0xDEADBEEFFEED;
  top->eval();
  test.check("0xDEADBEEFFEED input should be '3q2+7/7t' (0x3371322b372f3774)", top->output_o == 0x3371322b372f3774);

  delete top;

  test.report();

  exit(0);
}
