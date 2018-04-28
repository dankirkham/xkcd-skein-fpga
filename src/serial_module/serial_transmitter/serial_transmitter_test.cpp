#include <iostream>
#include <fstream>
#include <string>

#include "Vserial_transmitter.h"
#include "verilated.h"
#include "test.h"

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Test test = Test(argv[0]);

  Vserial_transmitter* top = new Vserial_transmitter;

  top->clk_i = 0;
  top->header_byte_i = 0x9A;
  top->status_byte_i = 0xD4;
  top->tx_busy_i = 0;
  top->ram_i = 0xFF;
  top->transmit_i = 0;
  top->eval();
  test.check("Module should not be transmitting", top->new_tx_data_o == 0);
  test.check("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Module should not be transmitting", top->new_tx_data_o == 0);
  test.check("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Module should not be transmitting", top->new_tx_data_o == 0);
  test.check("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Module should not be transmitting", top->new_tx_data_o == 0);
  test.check("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->transmit_i = 1;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Module should not be transmitting", top->new_tx_data_o == 0);
  test.check("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->transmit_i = 0;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Module should be transmitting", top->new_tx_data_o == 1);
  test.check("Module should be tansmitting the header byte", top->tx_data_o == 0x9A);
  test.check("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Module should be transmitting", top->new_tx_data_o == 1);
  test.check("Module should be tansmitting the status byte", top->tx_data_o == 0xD4);
  test.check("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Module should be transmitting", top->new_tx_data_o == 1);
  test.check("Module should be tansmitting the RAM byte", top->tx_data_o == 0xFF);
  test.check("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->tx_busy_i = 1;
  for (int i = 0; i < 10; i++) {
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
    test.check("Module should not be transmitting", top->new_tx_data_o == 0);
    test.check("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);
  }

  top->tx_busy_i = 0;
  for (int i = 0; i < 21; i++) {
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
    test.check("Module should be transmitting", top->new_tx_data_o == 1);
    test.check("Module should be tansmitting the RAM byte", top->tx_data_o == 0xFF);
    test.check("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);
  }

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  test.check("Module should not be transmitting", top->new_tx_data_o == 0);
  test.check("Module SHOULD be reseting Best Nonce Module", top->reset_best_nonce_module_o == 1);

  for (int i = 0; i < 10; i++) {
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
    test.check("Module should not be transmitting", top->new_tx_data_o == 0);
    test.check("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);
  }

  delete top;

  test.report();

  exit(0);
}
