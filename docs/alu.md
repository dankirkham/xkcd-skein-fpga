# Arithmetic Logic Unit (ALU)
The ALU is responsible for performing the major arithmetic operations necessary to compute the hash, such as addition, XOR, and bit rotation. It is also responsible for comparing the computed hash value to find the best possible hash.

![Arithmetic Logic Unit](../gfx/alu.svg?raw=true)

## Design Requirements
- 64-bit word size
- Addition
- XOR
- Rotate Right
- Rotate Left
- Bit Counter
- Result Comparison
  - Given the following variables:
    - best_nonce - The nonce used to calculate the best result.
    - best_bits - The number of bits off target for the best computed value.
    - result_nonce - The nonce used to calculate the newly computed hash value.
    - result_bits - The number of bits off target of the newly computed hash value.
  - If result_bits < best_bits:
    - best_nonce = result_nonce
    - best_bits = result_bits
- Pass-through to RAM and main-bus

## Control Bits
The ALU has 11 total control bits, shown as follows:

- 2 bits for the Rotator
  - Control bits encode the mode that the rotator is in.
    - 00: Idle
    - 01: Rotate Right
    - 10: Rotate Left
    - 11: Write
- 1 bit for Compare Register 1
- 1 bit for Compare Register 2
- 1 bit for Pass-through Demux
  - Technically two bits, but the second bit is internal from the comparator.
  - The one bit here controls whether the comparator select is used, or if input 2 is passed through.
- 1 bit for Comparator Demux
- 3 bits for Output Demux
- 2 bits for Bit Counter
  - Reset and Enable

## Instructions
Only 8 Instructions!

- XOR
- Addition
- Rotate Register Write / Input 2 Pass-through
  - We can combine these two, because they do not interfere with one another.
- Rotate Register Rotate Left & Count
- Rotate Register Rotate Right & Count
- Compare Register 1 Write
- Compare Register 2 Write & Compare
- Compare Register Nonce Pass-through
