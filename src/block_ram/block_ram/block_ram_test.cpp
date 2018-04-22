#include <iostream>
#include <string>

#include "Vblock_ram.h"
#include "verilated.h"

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);

  Vblock_ram* top = new Vblock_ram;

  top->clk_i = 0;

  // Write Value at 0xF
  top->address_i = 0xF;
  top->data_i = 42;
  top->write_i = 1;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Value at 0xDE
  top->address_i = 0xDE;
  top->data_i = 1337;
  top->write_i = 1;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Read Value at 0xF
  top->address_i = 0xF;
  top->write_i = 0;
  top->clk_i ^= 1;
  top->eval();

  // Check mid-cycle
  if (top->data_o == 42) {
    cout << "Pass!" << endl;
  } else {
    cout << "Fail!" << endl;
  }

  top->clk_i ^= 1;
  top->eval();

  // Read Value at 0xDE
  top->address_i = 0xDE;
  top->write_i = 0;
  top->clk_i ^= 1;
  top->eval();

  // Check mid-cycle
  if (top->data_o == 1337) {
    cout << "Pass!" << endl;
  } else {
    cout << "Fail!" << endl;
  }

  top->clk_i ^= 1;
  top->eval();

  // Write all cells
  for (int i = 0; i < 256; i++) {
    // Write Value at i
    top->address_i = i;
    top->data_i = (255 * i) ^ 0xBEEF;
    top->write_i = 1;
    top->clk_i ^= 1;
    top->eval();
    top->clk_i ^= 1;
    top->eval();
  }

  bool fail = false;

  // Read all cells
  for (int i = 0; i < 256; i++) {
    // Read Value at i
    top->address_i = i;
    top->write_i = 0;
    top->clk_i ^= 1;
    top->eval();
    
    // Check mid-cycle
    if (top->data_o != ((255 * i) ^ 0xBEEF)) {
      fail = true;
    }

    top->clk_i ^= 1;
    top->eval();
  }

  if (!fail) {
    cout << "Pass!" << endl;
  } else {
    cout << "Fail!" << endl;
  }

  // Write all cells, inverted
  for (int i = 0; i < 256; i++) {
    // Write Value at i
    top->address_i = i;
    top->data_i = ~((255 * i) ^ 0xBEEF);
    top->write_i = 1;
    top->clk_i ^= 1;
    top->eval();
    top->clk_i ^= 1;
    top->eval();
  }

  fail = false;

  // Read all cells, inverted
  for (int i = 0; i < 256; i++) {
    // Read Value at i
    top->address_i = i;
    top->write_i = 0;
    top->clk_i ^= 1;
    top->eval();

    // Check mid-cycle
    if (top->data_o != (unsigned short)~((255 * i) ^ 0xBEEF)) {
      fail = true;
    }

    top->clk_i ^= 1;
    top->eval();
  }

  if (!fail) {
    cout << "Pass!" << endl;
  } else {
    cout << "Fail!" << endl;
  }

  delete top;

  exit(0);
}
