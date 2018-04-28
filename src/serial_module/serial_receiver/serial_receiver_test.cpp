#include <iostream>
#include <fstream>
#include <string>

#include "Vserial_receiver.h"
#include "verilated.h"
#include "test.h"

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Test test = Test(argv[0]);

  Vserial_receiver* top = new Vserial_receiver;

  top->clk_i = 0;
  top->header_constant_i = 0x9A;
  top->eval();
  test.check("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Nonce should not be ready", top->nonce_ready_o == 0);


  // Bad Header Test
  top->rx_byte_i = 0xD4;
  top->new_rx_byte_i = 1;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();

  for (int i = 0; i < 12; i++) {
    top->rx_byte_i = i;
    top->new_rx_byte_i = 1;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  }
  test.check("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Nonce should not be ready", top->nonce_ready_o == 0);


  // Good Header Test
  top->rx_byte_i = 0x9A;
  top->new_rx_byte_i = 1;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();

  for (int i = 0; i < 12; i++) {
    top->rx_byte_i = i;
    top->new_rx_byte_i = 1;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  }
  test.check("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Nonce should be ready", top->nonce_ready_o == 1);


  // Timeout Test
  top->rx_byte_i = 0x9A;
  top->new_rx_byte_i = 1;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();

  // Only send 11 bytes
  for (int i = 0; i < 11; i++) {
    top->rx_byte_i = i;
    top->new_rx_byte_i = 1;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  }
  test.check("Nonce should not be ready", top->nonce_ready_o == 0);

  for (int i = 0; i < 49999988; i++) {
    top->rx_byte_i = 0;
    top->new_rx_byte_i = 0;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  }

  // Send 12th byte
  top->rx_byte_i = 11;
  top->new_rx_byte_i = 1;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Nonce should not be ready", top->nonce_ready_o == 0);

  for (int i = 0; i < 49999988; i++) {
    top->rx_byte_i = 0;
    top->new_rx_byte_i = 0;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  }
  test.check("Nonce should still not be ready", top->nonce_ready_o == 0);

  // Byte Pass Through and Shift-In Test
  top->rx_byte_i = 0x9A;
  top->new_rx_byte_i = 1;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Nonce Byte should not be shifted-in", top->nonce_shift_in_o == 0);

  for (int i = 0; i < 12; i++) {
    top->rx_byte_i = i;
    top->new_rx_byte_i = 1;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
    test.check("Nonce Byte should be passed through", top->nonce_byte_o == i);
    test.check("Nonce Byte should be shifted-in", top->nonce_shift_in_o == 1);
  }

  for (int i = 0; i < 100; i++) {
    top->rx_byte_i = 0;
    top->new_rx_byte_i = 0;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  }
  test.check("Nonce Byte should not be shifted-in", top->nonce_shift_in_o == 0);

  delete top;

  test.report();

  exit(0);
}
