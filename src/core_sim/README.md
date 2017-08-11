# Core Simulator
Core Simulator is a tool for testing Assembly Language code on a simulator core. It is useful for unit testing Assembly language instructions for verifying both the Assembler implementation and the Assembly language specification. It is also useful for confirming functional completeness of the overall chip design.

## Requirements

- [Verilator](https://www.veripool.org/wiki/verilator)
  - `brew install verilator` on MacOS
- Python 3
- xsf_asm Assembler (Requires Python 3)
  - See [xsf_asm readme](https://github.com/dankirkham/xkcd-skein-fpga/tree/master/tools/xsf_asm) for information on how to install.

## Running Unit Tests

```
cd src/core_sim
make
```
