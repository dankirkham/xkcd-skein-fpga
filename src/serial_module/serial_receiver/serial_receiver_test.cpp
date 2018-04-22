#include <iostream>
#include <fstream>
#include <string>

#include "Vserial_receiver.h"
#include "verilated.h"

int tests = 0;
int failures = 0;

void _assert(std::string assertation, bool condition) {
  tests++;
  cout << assertation << ": ";
  if (condition) {
    cout << "\033[1;35mPass!\033[0m" << endl;
  } else {
    cout << "\033[1;31mFail!\033[0m" << endl;
    failures++;
  }
}

void _report(std::string name) {
  ofstream output_file;
  output_file.open(name + ".txt");
  output_file << name << ": " << std::to_string(tests) << " assertions; " << std::to_string(tests - failures) << " passed; " << std::to_string(failures) << " failed.\n";
  output_file.close();
}

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);

  Vserial_receiver* top = new Vserial_receiver;

  top->clk_i = 0;
  top->header_constant_i = 0x9A;
  top->eval();
  _assert("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Nonce should not be ready", top->nonce_ready_o == 0);


  // Bad Header Test
  top->rx_byte_i = 0xD4;
  top->new_rx_byte_i = 1;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();

  for (int i = 0; i < 12; i++) {
    top->rx_byte_i = i;
    top->new_rx_byte_i = 1;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  }
  _assert("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Nonce should not be ready", top->nonce_ready_o == 0);


  // Good Header Test
  top->rx_byte_i = 0x9A;
  top->new_rx_byte_i = 1;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();

  for (int i = 0; i < 12; i++) {
    top->rx_byte_i = i;
    top->new_rx_byte_i = 1;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  }
  _assert("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Nonce should be ready", top->nonce_ready_o == 1);


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
  _assert("Nonce should not be ready", top->nonce_ready_o == 0);

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
  _assert("Nonce should not be ready", top->nonce_ready_o == 0);

  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Nonce should not be ready", top->nonce_ready_o == 0);

  for (int i = 0; i < 49999988; i++) {
    top->rx_byte_i = 0;
    top->new_rx_byte_i = 0;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  }
  _assert("Nonce should still not be ready", top->nonce_ready_o == 0);

  // Byte Pass Through and Shift-In Test
  top->rx_byte_i = 0x9A;
  top->new_rx_byte_i = 1;
  top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  _assert("Nonce Byte should not be shifted-in", top->nonce_shift_in_o == 0);

  for (int i = 0; i < 12; i++) {
    top->rx_byte_i = i;
    top->new_rx_byte_i = 1;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
    _assert("Nonce Byte should be passed through", top->nonce_byte_o == i);
    _assert("Nonce Byte should be shifted-in", top->nonce_shift_in_o == 1);
  }

  for (int i = 0; i < 100; i++) {
    top->rx_byte_i = 0;
    top->new_rx_byte_i = 0;
    top->clk_i = 1; top->eval(); top->clk_i = 0; top->eval();
  }
  _assert("Nonce Byte should not be shifted-in", top->nonce_shift_in_o == 0);

  delete top;

  _report(argv[0]);

  exit(0);
}
