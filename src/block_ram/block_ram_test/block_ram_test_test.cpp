#include <iostream>
#include <string>

#include "Vblock_ram_test.h"
#include "verilated.h"

void _assert(std::string assertation, bool condition) {
  cout << assertation << ": ";
  if (condition) {
    cout << "\033[1;35mPass!\033[0m" << endl;
  } else {
    cout << "\033[1;31mFail!\033[0m" << endl;
  }
}

void edge(Vblock_ram_test* top) {
  top->eval();
  top->clk_i ^= 1;
}

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);

  Vblock_ram_test* top = new Vblock_ram_test;

  top->clk_i = 0;
  top->tx_busy_i = 0;

  // Send Header Byte
  top->rx_byte_i = 0x9A;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  // Send Address Byte
  top->rx_byte_i = 0xD4;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  _assert("Address Output Test", top->address_o == 0xD4);
  _assert("Write bit should not be set", top->write_o == 0);

  // Send Write Byte
  top->rx_byte_i = 0x01;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  _assert("Write bit should not be set", top->write_o == 0);

  // Send Data Byte Low
  top->rx_byte_i = 0xEF;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  _assert("Write bit should not be set", top->write_o == 0);

  // Send Data Byte High
  top->rx_byte_i = 0xBE;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  _assert("Write bit SHOULD be set", top->write_o != 0);
  _assert("Address Output Test", top->address_o == 0xD4);
  _assert("Data Output Test", top->data_o == 0xBEEF);

  // Ready
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 0;
  edge(top);
  edge(top);

  _assert("Write bit should not be set", top->write_o == 0);

  // Send Header Byte
  top->rx_byte_i = 0x9A;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  // Send Address Byte
  top->rx_byte_i = 0x42;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  _assert("Address Output Test", top->address_o == 0x42);
  _assert("New TX Data bit should NOT be set", top->new_tx_data_o == 0);

  // Provide data
  top->data_i = 0xDEAD;

  // Send Read Byte
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  _assert("Write bit should not be set", top->write_o == 0);
  _assert("New TX Data bit should NOT be set", top->new_tx_data_o == 0);

  // Receive Header
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 0;
  edge(top);
  edge(top);

  _assert("Write bit should not be set", top->write_o == 0);
  _assert("New TX Data bit SHOULD be set", top->new_tx_data_o != 0);
  _assert("TX Data should be the header constant", top->tx_byte_o == 0x9A);

  // Receive Data Byte Low
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 0;
  edge(top);
  edge(top);

  _assert("Write bit should not be set", top->write_o == 0);
  _assert("New TX Data bit SHOULD be set", top->new_tx_data_o != 0);
  cout << std::to_string(top->tx_byte_o) << endl;
  _assert("TX Data should be valid", top->tx_byte_o == 0xAD);

  // Receive Data Byte High
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 0;
  edge(top);
  edge(top);

  _assert("Write bit should not be set", top->write_o == 0);
  _assert("New TX Data bit SHOULD be set", top->new_tx_data_o != 0);
  cout << std::to_string(top->tx_byte_o) << endl;
  _assert("TX Data should be valid", top->tx_byte_o == 0xDE);

  delete top;

  exit(0);
}
