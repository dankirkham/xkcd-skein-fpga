#include <iostream>
#include <string>

#include "Vserial_transmitter.h"
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

  Vserial_transmitter* top = new Vserial_transmitter;

  top->clk_i = 0;
  top->header_byte_i = 0x9A;
  top->status_byte_i = 0xD4;
  top->tx_busy_i = 0;
  top->ram_i = 0xFF;
  top->transmit_i = 0;
  top->eval();
  _assert("Module should not be transmitting", top->new_tx_data_o == 0);
  _assert("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Module should not be transmitting", top->new_tx_data_o == 0);
  _assert("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Module should not be transmitting", top->new_tx_data_o == 0);
  _assert("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Module should not be transmitting", top->new_tx_data_o == 0);
  _assert("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->transmit_i = 1;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Module should not be transmitting", top->new_tx_data_o == 0);
  _assert("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->transmit_i = 0;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Module should be transmitting", top->new_tx_data_o == 1);
  _assert("Module should be tansmitting the header byte", top->tx_data_o == 0x9A);
  _assert("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Module should be transmitting", top->new_tx_data_o == 1);
  _assert("Module should be tansmitting the status byte", top->tx_data_o == 0xD4);
  _assert("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Module should be transmitting", top->new_tx_data_o == 1);
  _assert("Module should be tansmitting the RAM byte", top->tx_data_o == 0xFF);
  _assert("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);

  top->tx_busy_i = 1;
  for (int i = 0; i < 10; i++) {
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
    _assert("Module should not be transmitting", top->new_tx_data_o == 0);
    _assert("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);
  }

  top->tx_busy_i = 0;
  for (int i = 0; i < 21; i++) {
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
    _assert("Module should be transmitting", top->new_tx_data_o == 1);
    _assert("Module should be tansmitting the RAM byte", top->tx_data_o == 0xFF);
    _assert("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);
  }

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Module should not be transmitting", top->new_tx_data_o == 0);
  _assert("Module SHOULD be reseting Best Nonce Module", top->reset_best_nonce_module_o == 1);

  for (int i = 0; i < 10; i++) {
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
    _assert("Module should not be transmitting", top->new_tx_data_o == 0);
    _assert("Module should not be reseting Best Nonce Module", top->reset_best_nonce_module_o == 0);
  }

  delete top;

  exit(0);
}
