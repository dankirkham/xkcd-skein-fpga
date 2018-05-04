#include <iostream>
#include <fstream>
#include <string>

#include "Vcore_id_module.h"
#include "verilated.h"
#include "test.h"

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Test test = Test(argv[0]);

  Vcore_id_module* top = new Vcore_id_module;

  top->clk_i = 0;
  top->eval();

  test.check("Core ID Output should be 42", top->core_id_o == 42);
  test.check("Output should not be enabled", !top->output_enable_o);

  top->output_enable_i = 1;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Core ID Output should be 42", top->core_id_o == 42);
  test.check("Output should not be enabled", !top->output_enable_o);

  top->core_selection_i = 42;
  top->save_selection_i = 1;
  top->output_enable_i = 0;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Core ID Output should be 42", top->core_id_o == 42);
  test.check("Output should not be enabled", !top->output_enable_o);

  top->core_selection_i = 0;
  top->save_selection_i = 0;
  top->output_enable_i = 1;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Core ID Output should be 42", top->core_id_o == 42);
  test.check("Output should be enabled", top->output_enable_o);

  top->core_selection_i = 0;
  top->save_selection_i = 0;
  top->output_enable_i = 0;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Core ID Output should be 42", top->core_id_o == 42);
  test.check("Output should not be enabled", !top->output_enable_o);

  top->core_selection_i = 12;
  top->save_selection_i = 1;
  top->output_enable_i = 0;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Core ID Output should be 42", top->core_id_o == 42);
  test.check("Output should not be enabled", !top->output_enable_o);

  top->core_selection_i = 0;
  top->save_selection_i = 0;
  top->output_enable_i = 1;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Core ID Output should be 42", top->core_id_o == 42);
  test.check("Output should NOT be enabled", !top->output_enable_o);

  top->core_selection_i = 42;
  top->save_selection_i = 1;
  top->output_enable_i = 0;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Core ID Output should be 42", top->core_id_o == 42);
  test.check("Output should not be enabled", !top->output_enable_o);

  top->core_selection_i = 0;
  top->save_selection_i = 0;
  top->output_enable_i = 1;
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
  top->eval();

  test.check("Core ID Output should be 42", top->core_id_o == 42);
  test.check("Output should be enabled", top->output_enable_o);

  delete top;

  test.report();

  exit(0);
}
