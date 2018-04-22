#include <iostream>
#include <fstream>
#include <string>

#include "Vxkcd_skein_processor.h"
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

void tick(Vxkcd_skein_processor* top) {
  top->eval();
  top->clk_i = 1;
  top->eval();
  top->clk_i = 0;
}


int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);

  Vxkcd_skein_processor* top = new Vxkcd_skein_processor;

  top->clk_i = 0x0;
  top->rst_i = 0;
  // top->save_selection_i = 0;
  // top->main_bus_i = 0;
  // top->ram_i = 0;
  // top->reset_best_nonce_i = 0;
  tick(top);

  // Reset
  top->rst_i = 1;
  tick(top);
  top->rst_i = 0;
  tick(top);

  // top->save_selection_i = 1;
  // top->main_bus_i = 42;
  // top->ram_i = 0;
  // top->reset_best_nonce_i = 0;
  //
  // rise(top);
  // _assert("it should be pointing to the Best Bits Off Address in RAM", top->ram_address_o == 0xA);
  // _assert("it should NOT be writing to RAM", top->ram_write_o == 0);
  // fall(top);

  delete top;

  _report(argv[0]);

  exit(0);
}
