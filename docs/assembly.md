# Assembly Language

The assembly language specified here is used to abstract away the lower level machine-language instructions. It also serves to translate the logical address space to the physical address space. All assembly language instructions are high level, meaning they use the logical address space. All interaction with the physical address space happens under-the-hood by the assembler.

## RAM Address Spaces
### Logical
The logical address space is the higher-level address space. It uses a 64-bit word size, which is the same as the Skein word size.

### Physical
The physical address space is the lower-level address space. It uses a 16-bit word size. It is necessary because the Spartan 6 block RAM is only 16-bits wide. (In 9K TDP Mode)

## Instructions
### Load
Loads a 64-bit word from the RAM at the specified address to either the Primary or Secondary Register.

Syntax: `Load <Address> <Primary or Secondary>`

Implementation:

| Instruction | RAM Address        | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | ---------- | ------------------------------------------------- |
| 1           | \<Address> * 4     | 0x1 or 0x5 | Write Primary or Secondary Register Lower 16-bits |
| 2           | Don't care         | 0x2 or 0x6 | Rotate Primary or Secondary Register Left 16-bits |
| 3           | \<Address> * 4 + 1 | 0x1 or 0x5 | Write Primary or Secondary Register Lower 16-bits |
| 4           | Don't care         | 0x2 or 0x6 | Rotate Primary or Secondary Register Left 16-bits |
| 5           | \<Address> * 4 + 2 | 0x1 or 0x5 | Write Primary or Secondary Register Lower 16-bits |
| 6           | Don't care         | 0x2 or 0x6 | Rotate Primary or Secondary Register Left 16-bits |
| 7           | \<Address> * 4 + 3 | 0x1 or 0x5 | Write Primary or Secondary Register Lower 16-bits |

### Constant
Loads a 64-bit word from the Constants ROM at the specified address to the Primary Register.

Syntax: `Constant <Address>`

Implementation:

| Instruction | Constant Address  | ALU Opcode | ALU Operation                                     |
| ----------- | ----------------- | ---------- | ------------------------------------------------- |
| 1           | <Address>         | 0x0        | Write Primary Register                            |

### Add
Adds the value stored in the Primary Register to the value stored in the Secondary Register and stores it in RAM at the specified address. **Caution:** The instruction overwrites the value stored in the Primary Register. When this instruction is finished the sum will be stored in the Primary Register.

Syntax: `Add <Address>`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------- |
| 1           | Don't care         | 0         | 0x8        | Add                                               |
| 2           | \<Address> * 4     | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 3           | \<Address> * 4 + 1 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 4           | \<Address> * 4 + 2 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 5           | \<Address> * 4 + 3 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |

### XOR
XORs the value stored in the Primary Register with the value stored in the Secondary Register and stores it in RAM at the specified address. **Caution:** The instruction overwrites the value stored in the Primary Register. When this instruction is finished the XOR result will be stored in the Primary Register.

Syntax: `XOR <Address>`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------- |
| 1           | Don't care         | 0         | 0x7        | XOR                                               |
| 2           | \<Address> * 4     | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 3           | \<Address> * 4 + 1 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 4           | \<Address> * 4 + 2 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 5           | \<Address> * 4 + 3 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |

### Save
Saves the value stored in the Primary Register to the RAM at the specified address.

Syntax: `Save <Address>`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------- |
| 1           | \<Address> * 4     | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 2           | \<Address> * 4 + 1 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 3           | \<Address> * 4 + 2 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 4           | \<Address> * 4 + 3 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |

### SaveBitCounter
Saves the lower 10-bits stored in the Primary Register to the Bit Counter Register.

Syntax: `SaveBitCounter`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------- |
| 1           |                    | 0         | 0x9        | Write Bit Counter                                 |

### SaveComparator
Saves the lower 10-bits stored in the Secondary Register to the Comparator Register. Then writes to RAM either the Bit Counter Register or the Comparator Register, whichever is lower.

Syntax: `SaveComparatorAndCompare <Address>`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------- |
| 1           | \<Address> * 4     | 1         | 0xA        | Write Comparator Register & Compare               |

### SaveNonce
Saves to RAM either the Primary Register or Secondary Register value, depending on the values stored in the Bit Counter Register and Comparator Register. If `Bit Counter Register >= Comparator Register`, then the Secondary Register is stored in RAM at the specified address. If `Bit Counter Register < Comparator Register`, then the Primary Register is stored in RAM at the specified address.

**This instruction is not yet implemented because it requires ALU changes.**

### Count
Increments the Bit Counter Register once for each one bit stored in the Primary Register. This counts the bits in one 64-bit word. For actual bits-off calculation, the Bit Counter Register must be zerod, and then a `Load` instruction followed by a `Count` instruction must be repeated 16 times (to count all 1024 bits).

Syntax: `Count`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                                |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------------------ |
| 1-64        | Don't Care         | 0         | 0x3        | Rotate Primary Register Left 1-bit and Increment Bit Counter |

### RotateLeft
Rotates left the Primary Register a specified number of bits. Since the ALU can rotate only 8-bits or 1-bit at a time, the machine-level implementation of this instruction can vary in length. For this reason, the "Instruction" column is replaced with a "Repetitions" column. **Caution:** The instruction voids the value stored in the Bit Counter Register. This is because of the "Rotate Primary Register Left 1-bit and Increment Bit Counter" ALU operation.

Syntax: `RotateLeft <Bits>`

Implementation:
1. Rotate Primary Register Left 16-bits. (0x2) Do this `<Bits> / 16` times.
2. Rotate Primary Register Left 1-bit. (0x3) Do this `<Bits> % 16` times.

| Repetitions       | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                                |
| ----------------- | ------------------ | --------- | ---------- | ------------------------------------------------------------ |
| int(<Bits> / 16)  | 0                  | 0         | 0x2        | Rotate Primary Register Left 16-bits                         |
| <Bits> mod 16     | 0                  | 0         | 0x3        | Rotate Primary Register Left 1-bit and Increment Bit Counter |
