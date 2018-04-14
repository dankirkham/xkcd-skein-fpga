#include <iostream>
#include <string>

#include "Vbest_nonce_module.h"
#include "verilated.h"

void _assert(std::string assertation, bool condition) {
  cout << assertation << ": ";
  if (condition) {
    cout << "\033[1;35mPass!\033[0m" << endl;
  } else {
    cout << "\033[1;31mFail!\033[0m" << endl;
  }
}

void dump(Vbest_nonce_module* top) {
  cout << "  ram_o =         " << std::to_string(top->ram_o) << endl;
  cout << "  ram_address_o = " << std::to_string(top->ram_address_o) << endl;
  cout << "  ram_write_o =   " << std::to_string(top->ram_write_o) << endl;
}

void rise(Vbest_nonce_module* top) {
  top->eval();
  top->clk_i = 1;
  // dump(top);
}

void fall(Vbest_nonce_module* top) {
  top->eval();
  top->clk_i = 0;
  // dump(top);
}

void tick(Vbest_nonce_module* top) {
  rise(top);
  fall(top);
}


int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);

  Vbest_nonce_module* top = new Vbest_nonce_module;

  top->clk_i = 0x0;
  top->rst_i = 0;
  top->save_selection_i = 0;
  top->main_bus_i = 0;
  top->ram_i = 0;
  top->reset_best_nonce_i = 0;
  tick(top);

  // Reset
  top->rst_i = 1;
  tick(top);
  top->rst_i = 0;
  tick(top);

  // Clock 1 - SelectCoreNonce
  top->save_selection_i = 1;
  top->main_bus_i = 42;
  top->ram_i = 0;
  top->reset_best_nonce_i = 0;

  rise(top);
  _assert("it should be pointing to the Best Bits Off Address in RAM", top->ram_address_o == 0xA);
  _assert("it should NOT be writing to RAM", top->ram_write_o == 0);
  fall(top);

  // Clock 2 - Read BITS_OFF (Clock 1 of 4)
  top->save_selection_i = 0;
  top->main_bus_i = 512;
  top->ram_i = 1023;
  top->reset_best_nonce_i = 0;

  rise(top);
  _assert("it should be pointing to the Best Bits Off Address in RAM", top->ram_address_o == 0xA);
  _assert("it should be driving new best bits off to RAM", top->ram_o == 512);
  _assert("it should be writing to RAM", top->ram_write_o == 1);
  fall(top);

  // Clock 3 - Read BITS_OFF (Clock 2 of 4)
  top->save_selection_i = 0;
  top->main_bus_i = 0;
  top->ram_i = 0;
  top->reset_best_nonce_i = 0;

  rise(top);
  _assert("it should be pointing to the Best CoreID High Word in RAM", top->ram_address_o == 0x9);
  _assert("it should be driving Best CoreID High Word to RAM", top->ram_o == 0);
  _assert("it should be writing to RAM", top->ram_write_o == 1);
  fall(top);

  // Clock 4 - Read BITS_OFF (Clock 3 of 4)
  top->save_selection_i = 0;
  top->main_bus_i = 0;
  top->ram_i = 0;
  top->reset_best_nonce_i = 0;

  rise(top);
  _assert("it should be pointing to the Best CoreID Low Word in RAM", top->ram_address_o == 0x8);
  _assert("it should be driving Best CoreID Low Word to RAM", top->ram_o == 42);
  _assert("it should be writing to RAM", top->ram_write_o == 1);
  fall(top);

  // Clock 5 - Read BITS_OFF (Clock 4 of 4)
  top->save_selection_i = 0;
  top->main_bus_i = 0;
  top->ram_i = 0;
  top->reset_best_nonce_i = 0;

  rise(top);
  _assert("it should NOT be writing to RAM", top->ram_write_o == 0);
  fall(top);

  // Clock 6 - 13 - Read Nonce
  for (int i = 0; i < 8; i ++) {
    top->save_selection_i = 0;
    top->main_bus_i = 0xBEEF + i;
    top->ram_i = 0;
    top->reset_best_nonce_i = 0;

    rise(top);
    _assert("it should be writing to RAM", top->ram_write_o == 1);
    _assert("it should be driving the main bus to RAM", top->ram_o == (0xBEEF + i));
    _assert("it should be pointing to nonce address", top->ram_address_o == i);
    fall(top);
  }

  // Clock 14 - Done
  top->save_selection_i = 0;
  top->main_bus_i = 0;
  top->ram_i = 0;
  top->reset_best_nonce_i = 0;

  rise(top);
  _assert("it should NOT be writing to RAM", top->ram_write_o == 0);
  fall(top);

  // Clock 15 - Reset
  top->save_selection_i = 0;
  top->main_bus_i = 0;
  top->ram_i = 0;
  top->reset_best_nonce_i = 1;

  rise(top);
  _assert("it should be pointing to the Best Bits Off Address in RAM", top->ram_address_o == 0xA);
  _assert("it should be driving 1023 to RAM", top->ram_o == 1023);
  _assert("it should be writing to RAM", top->ram_write_o == 1);
  fall(top);

  // Clock 16 - Done
  top->save_selection_i = 0;
  top->main_bus_i = 0;
  top->ram_i = 0;
  top->reset_best_nonce_i = 0;

  rise(top);
  _assert("it should NOT be writing to RAM", top->ram_write_o == 0);
  fall(top);

  delete top;

  exit(0);
}
