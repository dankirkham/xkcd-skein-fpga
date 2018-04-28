#include <iostream>
#include <string>

#include "Vblock_ram_test.h"
#include "verilated.h"
#include "test.h"

void edge(Vblock_ram_test* top) {
  top->eval();
  top->clk_i ^= 1;
}

void read_write_test(Test test) {
  cout << " * Read/Write Test" << endl;
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

  test.check("Address Output Test", top->address_o == 0xD4);
  test.check("Write bit should not be set", top->write_o == 0);

  // Send Write Byte
  top->rx_byte_i = 0x01;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  test.check("Write bit should not be set", top->write_o == 0);

  // Send Data Byte Low
  top->rx_byte_i = 0xEF;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  test.check("Write bit should not be set", top->write_o == 0);

  // Send Data Byte High
  top->rx_byte_i = 0xBE;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  test.check("Write bit SHOULD be set", top->write_o != 0);
  test.check("Address Output Test", top->address_o == 0xD4);
  test.check("Data Output Test", top->data_o == 0xBEEF);

  // Ready
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 0;
  edge(top);
  edge(top);

  test.check("Write bit should not be set", top->write_o == 0);

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

  test.check("Address Output Test", top->address_o == 0x42);
  test.check("New TX Data bit should NOT be set", top->new_tx_data_o == 0);

  // Provide data
  top->data_i = 0xDEAD;

  // Send Read Byte
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  test.check("Write bit should not be set", top->write_o == 0);
  test.check("New TX Data bit should NOT be set", top->new_tx_data_o == 0);

  // Receive Header
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 0;
  edge(top);
  edge(top);

  test.check("Write bit should not be set", top->write_o == 0);
  test.check("New TX Data bit SHOULD be set", top->new_tx_data_o != 0);
  test.check("TX Data should be the header constant", top->tx_byte_o == 0x9A);

  // TX Busy Wait
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 0;
  top->tx_busy_i = 1;
  for (int i = 0; i < 8; i++) {
    edge(top);
    edge(top);
  }

  // Receive Data Byte Low
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 0;
  top->tx_busy_i = 0;
  edge(top);
  edge(top);

  test.check("Write bit should not be set", top->write_o == 0);
  test.check("New TX Data bit SHOULD be set", top->new_tx_data_o != 0);
  test.check("TX Data should be valid", top->tx_byte_o == 0xAD);

  // TX Busy Wait
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 0;
  top->tx_busy_i = 1;
  for (int i = 0; i < 8; i++) {
    edge(top);
    edge(top);
  }

  // Receive Data Byte High
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 0;
  top->tx_busy_i = 0;
  edge(top);
  edge(top);

  test.check("Write bit should not be set", top->write_o == 0);
  test.check("New TX Data bit SHOULD be set", top->new_tx_data_o != 0);
  test.check("TX Data should be valid", top->tx_byte_o == 0xDE);

  delete top;
}

void bad_header_test(Test test) {
  cout << " * Bad Header Test" << endl;
  Vblock_ram_test* top = new Vblock_ram_test;

  top->clk_i = 0;
  top->tx_busy_i = 0;

  // Send Incorrect Header Byte
  top->rx_byte_i = 0xD4;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  // Send Address Byte
  top->rx_byte_i = 0x42;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  // Provide data
  top->data_i = 0xDEAD;

  // Send Read Byte
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 1;
  edge(top);
  edge(top);

  // Receive Header
  top->rx_byte_i = 0x00;
  top->new_rx_data_i = 0;
  edge(top);
  edge(top);

  test.check("New TX Data bit should NOT be set", top->new_tx_data_o == 0);
  test.check("TX Data should NOT be the header constant", top->tx_byte_o != 0x9A);

  delete top;


}

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Test test = Test(argv[0]);

  read_write_test(test);
  bad_header_test(test);

  test.report();

  exit(0);
}
