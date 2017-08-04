#include <iostream>
#include <string>

#include "Vcore_id_module.h"
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

  Vcore_id_module* top = new Vcore_id_module;

  top->clk_i = 0;
  top->eval();

  _assert("Core ID Output should be 42", top->core_id_o == 42);
  _assert("Output should not be enabled", !top->output_enable_o);

  top->output_enable_i = 1;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  _assert("Core ID Output should be 42", top->core_id_o == 42);
  _assert("Output should not be enabled", !top->output_enable_o);

  top->core_selection_i = 42;
  top->save_selection_i = 1;
  top->output_enable_i = 0;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  _assert("Core ID Output should be 42", top->core_id_o == 42);
  _assert("Output should not be enabled", !top->output_enable_o);

  top->core_selection_i = 0;
  top->save_selection_i = 0;
  top->output_enable_i = 1;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  _assert("Core ID Output should be 42", top->core_id_o == 42);
  _assert("Output should be enabled", top->output_enable_o);

  top->core_selection_i = 0;
  top->save_selection_i = 0;
  top->output_enable_i = 0;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  _assert("Core ID Output should be 42", top->core_id_o == 42);
  _assert("Output should not be enabled", !top->output_enable_o);

  top->core_selection_i = 12;
  top->save_selection_i = 1;
  top->output_enable_i = 0;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  _assert("Core ID Output should be 42", top->core_id_o == 42);
  _assert("Output should not be enabled", !top->output_enable_o);

  top->core_selection_i = 0;
  top->save_selection_i = 0;
  top->output_enable_i = 1;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  _assert("Core ID Output should be 42", top->core_id_o == 42);
  _assert("Output should NOT be enabled", !top->output_enable_o);

  top->core_selection_i = 42;
  top->save_selection_i = 1;
  top->output_enable_i = 0;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  _assert("Core ID Output should be 42", top->core_id_o == 42);
  _assert("Output should not be enabled", !top->output_enable_o);

  top->core_selection_i = 0;
  top->save_selection_i = 0;
  top->output_enable_i = 1;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  _assert("Core ID Output should be 42", top->core_id_o == 42);
  _assert("Output should be enabled", top->output_enable_o);

  delete top;

  exit(0);
}
