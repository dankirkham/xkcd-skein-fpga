# xsf_asm

An assembler for the [xkcd-skein-fpga](https://github.com/dankirkham/xkcd-skein-fpga) machine language. For a specification of the assembly language, see the [documentation](https://github.com/dankirkham/xkcd-skein-fpga/tree/master/docs/assembly.md).

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
