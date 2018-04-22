#include <iostream>
#include <fstream>
#include <string>

#include "Valu.h"
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

  Valu* top = new Valu;

  top->clk_i = 0;

  // Write primary register
  top->input_i = 0xDEADBEEF;
  top->opcode_i = 0x0;

  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Pass-through primary register
  top->opcode_i = 0xC;

  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  _assert("Write Primary Register Test", top->output_o == 0xDEADBEEF);

  // Write primary register
  top->input_i = 0;
  top->opcode_i = 0x0;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write bit counter register
  top->opcode_i = 0x9;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write primary register
  top->input_i = 0xDEADBEEF;
  top->opcode_i = 0x0;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  for (int i = 0; i < 64; i++) {
    // Count bit
    top->opcode_i = 0x3;
    top->clk_i ^= 1;
    top->eval();
    top->clk_i ^= 1;
    top->eval();
  }

  // Read Bit counter
  top->opcode_i = 0xD;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  _assert("Bit Counter Test", top->output_o == 24);

  // Write Primary register
  top->input_i = 0xDEADBEEF;
  top->opcode_i = 0x0;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Secondary Register
  top->opcode_i = 0x4;
  top->input_i = 0x5ca1ab1e;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Add
  top->opcode_i = 0x8;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Pass-through primary register
  top->opcode_i = 0xC;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  _assert("Adder Test", top->output_o == 0x13B4F6A0D);

  // Write Primary register
  top->input_i = 0xDEADBEEF;
  top->opcode_i = 0x0;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Secondary Register
  top->opcode_i = 0x4;
  top->input_i = 0x5ca1ab1e;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // XOR
  top->opcode_i = 0x7;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Pass-through primary register
  top->opcode_i = 0xC;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  _assert("XOR Test", top->output_o == (0xDEADBEEF ^ 0x5ca1ab1e));

  // Write Primary Register
  top->input_i = 0;
  top->opcode_i = 0x0;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Primary Register Lower 16-bits
  top->input_i = 0xCEED;
  top->opcode_i = 0x1;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Rotate Primary Register Left 16-bits
  top->opcode_i = 0x2;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Primary Register Lower 16-bits
  top->input_i = 0xEBEE;
  top->opcode_i = 0x1;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Rotate Primary Register Left 16-bits
  top->opcode_i = 0x2;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Primary Register Lower 16-bits
  top->input_i = 0xDEAD;
  top->opcode_i = 0x1;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Rotate Primary Register Left 16-bits
  top->opcode_i = 0x2;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Primary Register Lower 16-bits
  top->input_i = 0xBEEF;
  top->opcode_i = 0x1;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Pass-through primary register
  top->opcode_i = 0xC;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  _assert("16-bit Primary Register Write Test", top->output_o == 0xCEEDEBEEDEADBEEF);

  // Write Secondary Register
  top->input_i = 0;
  top->opcode_i = 0x4;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Rotate Primary and Secondary Register Left 16-bits
  top->opcode_i = 0x6;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Secondary Register Lower 16-bits
  top->input_i = 0x5CA1;
  top->opcode_i = 0x5;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Rotate Primary and Secondary Register Left 16-bits
  top->opcode_i = 0x6;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Secondary Register Lower 16-bits
  top->input_i = 0xAB1E;
  top->opcode_i = 0x5;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Rotate Primary and Secondary Register Left 16-bits
  top->opcode_i = 0x6;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Secondary Register Lower 16-bits
  top->input_i = 0xBA5E;
  top->opcode_i = 0x5;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Rotate Primary and Secondary Register Left 16-bits
  top->opcode_i = 0x6;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Secondary Register Lower 16-bits
  top->input_i = 0xBA11;
  top->opcode_i = 0x5;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Pass-through primary register
  top->opcode_i = 0xC;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  _assert("Secondary Register 16-bit Write Should Not Tamper with Primary Register Test", top->output_o == 0xCEEDEBEEDEADBEEF);

  // XOR
  top->opcode_i = 0x7;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  _assert("Secondary Register 16-bit Write Test", top->output_o == (0xCEEDEBEEDEADBEEF ^ 0x5CA1AB1EBA5EBA11));

  // Write Primary Register
  top->input_i = 435;
  top->opcode_i = 0x0;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Bit Counter Register
  top->opcode_i = 0x9;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Secondary Register
  top->input_i = 237;
  top->opcode_i = 0x4;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Bit Counter Pass-through
  top->opcode_i = 0xD;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  _assert("Bit Counter Write Test", top->output_o == 435);

  // Write Comparator Register
  top->opcode_i = 0xA;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Compare
  top->opcode_i = 0xE;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  _assert("Bit Count Comparison Test", top->output_o == 237);

  // Write Primary Register
  top->input_i = 0xDEAD;
  top->opcode_i = 0x0;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Write Secondary Register
  top->input_i = 1337;
  top->opcode_i = 0x4;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  // Pass-through nonce
  top->opcode_i = 0xB;
  top->clk_i ^= 1;
  top->eval();
  top->clk_i ^= 1;
  top->eval();

  _assert("Nonce Pass-through Test", top->output_o == 1337);

  delete top;

  _report(argv[0]);

  exit(0);
}
