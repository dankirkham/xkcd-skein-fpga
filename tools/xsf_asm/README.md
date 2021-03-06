# xsf_asm

An assembler for the [xkcd-skein-fpga](https://github.com/dankirkham/xkcd-skein-fpga) machine language. For a specification of the assembly language, see the [Assembly Language Documentation](https://github.com/dankirkham/xkcd-skein-fpga/tree/master/docs/assembly.md). An assembly language file can be used to program the Hasher Core and it can also be used by the Hasher Core Simulator for verification.

## Installation

Requires Python 3.6

```
cd xsf_asm/
python3 setup.py install
```

## Usage
Using sample assembly file `code.asm`:
```
Constant 10
Constant 15
Add
Save 10
Read 10
```

To build this file run:

```
xsf_asm code.asm
```

The program will be assembled into the machine language output `code.ml`.

## Output Format
Output files are currently only in a 18-bit hexadecimal format (between 0x00000 and 0x3ffff). The 18 bits are mapped as follows:

`abccccccccddefgggg`

- a: Save Core Selection
- b: Ram Write Bit
- cccccccc: Address Bus (8-bit)
- dd: Input Select (2-bit)
  - 00: Core Input
  - 01: RAM Output
  - 10: Core ID
- e: Output Select
- f: Output Enable
- gggg: ALU Opcode (4-bit) See [ALU Documentation](https://github.com/dankirkham/xkcd-skein-fpga/blob/master/docs/alu.md)
