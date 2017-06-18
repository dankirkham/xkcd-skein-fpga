#include <iostream>
#include <string>

#include "Vcomparator.h"
#include "verilated.h"

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);

  Vcomparator* top = new Vcomparator;

  // init sim inputs
  top->bit_counter_register_i = 0;
  top->comparator_register_i = 0;

  int failures = 0;

  for (int bit_counter_register = 0; bit_counter_register < 1024; bit_counter_register++) {
    for (int comparator_register = 0; comparator_register < 1024; comparator_register++) {
      top->bit_counter_register_i = bit_counter_register;
      top->comparator_register_i = comparator_register;

      top->eval();

      bool expected_value = bit_counter_register < comparator_register;
      bool actual_value = top->select_o;

      if (expected_value != actual_value) {
        failures++;

        cout << "Failure: " << endl;
        cout << "  bit_counter_register_i == " << std::to_string(top->bit_counter_register_i) << endl;
        cout << "  comparator_register_i ==  " << std::to_string(top->comparator_register_i) << endl;
        cout << "  output value ==           " << (top->select_o ? "True" : "False") << endl;
      }
    }
  }

  cout << "Tests completed with " << std::to_string(failures) << " failures." << endl;

  delete top;

  exit(0);
}
