#include <iostream>
#include <fstream>
#include <string>

#include "Vblock_ram.h"
#include "verilated.h"
#include "test.h"

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Test test = Test(argv[0]);

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
  test.check("Read cell", top->data_o == 42);

  top->clk_i ^= 1;
  top->eval();

  // Read Value at 0xDE
  top->address_i = 0xDE;
  top->write_i = 0;
  top->clk_i ^= 1;
  top->eval();

  // Check mid-cycle
  test.check("Read cell", top->data_o == 1337);

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

  test.check("Read all cells", !fail);

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

  test.check("Read all cells", !fail);

  delete top;

  test.report();

  exit(0);
}
