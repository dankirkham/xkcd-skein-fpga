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
  top->eval();
  _assert("Module should not be transmitting", top->new_tx_data_o == 0);

  // top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  // _assert("Nonce should not be ready", top->nonce_ready_o == 0);

  delete top;

  exit(0);
}
