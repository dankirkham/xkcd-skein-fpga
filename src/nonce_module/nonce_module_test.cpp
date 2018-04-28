#include <iostream>
#include <fstream>
#include <string>

#include "Vnonce_module.h"
#include "verilated.h"
#include "test.h"

void tick(Vnonce_module* top) {
  top->eval();
  top->clk_i = 1;

  top->eval();
  top->clk_i = 0;
}

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Test test = Test(argv[0]);

  Vnonce_module* top = new Vnonce_module;

  top->ready_i = 0;
  top->increment_i = 0;

  // Shift in 0xDEADBEEFBA5EBA11FEED1337
  top->rx_byte_i = 0x37;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0x13;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0xED;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0xFE;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0x11;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0xBA;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0x5E;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0xBA;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0xEF;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0xBE;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0xAD;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0xDE;
  top->shift_in_i = 1;
  tick(top);

  top->rx_byte_i = 0;
  top->shift_in_i = 0;
  top->ready_i = 1;
  top->nonce_address_i = 0;
  top->output_enable_i = 1;
  tick(top);

  test.check("0xBA11FEED1337 encodes to \"uhH+7RM3\" (0x7568482b37524d33)", top->output_o == 0x7568482b37524d33);

  top->nonce_address_i = 1;
  tick(top);

  test.check("0xDEADBEEFBA5E encodes to \"3q2+77pe\" (0x3371322b37377065)", top->output_o == 0x3371322b37377065);

  top->nonce_address_i = 0;
  top->increment_i = 1;
  tick(top);

  test.check("Incremented value equals \"uhH+7RM4\" (0x7568482b37524d34)", top->output_o == 0x7568482b37524d34);

  delete top;

  test.report();

  exit(0);
}
