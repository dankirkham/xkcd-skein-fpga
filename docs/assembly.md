# Assembly Language

The assembly language specified here is used to abstract away the lower level machine-language instructions and to provide memory access. This contrasts to the ALU operations which have zero knowledge of memory addressing.

The assembler also serves to translate the logical address space to the physical address space. All assembly language instructions are high level, meaning they use the logical address space. All interaction with the physical address space happens under-the-hood by the assembler. 64-bit words are stored in RAM little-endian, 16-bits at a time.

## RAM Address Spaces
### Logical
The logical address space is the higher-level address space. It uses a 64-bit word size, which is the same as the Skein word size.

### Physical
The physical address space is the lower-level address space. It uses a 16-bit word size. It is necessary because the Spartan 6 block RAM is only 16-bits wide. (In 9K TDP Mode)

## Instructions

### Add
Adds the value stored in the Primary Register to the value stored in the Secondary Register and stores it in the Primary Register.

Syntax: `Add`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------- |
| 1           | Don't care         | 0         | 0x8        | Add                                               |

### Constant
Loads a 64-bit word from the Constants ROM at the specified address to the Primary Register.

Syntax: `Constant <Address>`

Implementation:

| Instruction | Constant Address  | ALU Opcode | ALU Operation                                     |
| ----------- | ----------------- | ---------- | ------------------------------------------------- |
| 1           | <Address>         | 0x0        | Write Primary Register                            |

### Count
Increments the Bit Counter Register once for each one bit stored in the Primary Register. This counts the bits in one 64-bit word. For actual bits-off calculation, the Bit Counter Register must be zeroed, and then a `Load` instruction followed by a `Count` instruction must be repeated 16 times (to count all 1024 bits). Upon completion, the counted value will be stored in the Bit Counter Register.

Syntax: `Count`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                                |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------------------ |
| 1-64        | Don't Care         | 0         | 0x3        | Rotate Primary Register Left 1-bit and Increment Bit Counter |

### Load
Loads a 64-bit word from the RAM at the specified address to either the Primary or Secondary Register.

Syntax: `Load <Address> <Primary or Secondary>`

Implementation:

| Instruction | RAM Address        | ALU Opcode | ALU Operation                                      |
| ----------- | ------------------ | ---------- | -------------------------------------------------- |
| 1           | Don't care         | 0x6        | Rotate Primary and Secondary Register Left 16-bits |
| 2           | \<Address> * 4 + 3 | 0x1 or 0x5 | Write Primary or Secondary Register Lower 16-bits  |
| 3           | Don't care         | 0x6        | Rotate Primary and Secondary Register Left 16-bits |
| 4           | \<Address> * 4 + 2 | 0x1 or 0x5 | Write Primary or Secondary Register Lower 16-bits  |
| 5           | Don't care         | 0x6        | Rotate Primary and Secondary Register Left 16-bits |
| 6           | \<Address> * 4 + 1 | 0x1 or 0x5 | Write Primary or Secondary Register Lower 16-bits  |
| 7           | Don't care         | 0x6        | Rotate Primary and Secondary Register Left 16-bits |
| 8           | \<Address> * 4     | 0x1 or 0x5 | Write Primary or Secondary Register Lower 16-bits  |

### RotateLeft
Rotates left the value in the Primary Register and stores it to RAM. Since the ALU can rotate only 16-bits or 1-bit at a time, the machine-level implementation of this instruction can vary in length. For this reason, the "Instruction" column is replaced with a "Repetitions" column. **Caution:** The instruction voids the value stored in the Primary Register and Bit Counter Register. This is because the 16-bit rotations are actually RAM address manipulations and because of the "Rotate Primary Register Left 1-bit and Increment Bit Counter" ALU operation, respectively.

Syntax: `RotateLeft <Bits> <Address>`

Implementation:

| Repetitions       | RAM Address                                  | RAM Write | ALU Opcode | ALU Operation                                                |
| ----------------- | -------------------------------------------- | --------- | ---------- | ------------------------------------------------------------ |
| \<Bits> mod 16    | 0                                            | 0         | 0x3        | Rotate Primary Register Left 1-bit and Increment Bit Counter |
| 1                 | \<Address> * 4 + int(\<Bits> / 16)           | 1         | 0x2        | Rotate Primary Register Left 16-bits                         |
| 1                 | \<Address> * 4 + (3 + int(\<Bits> / 16) % 4) | 1         | 0x2        | Rotate Primary Register Left 16-bits                         |
| 1                 | \<Address> * 4 + (2 + int(\<Bits> / 16) % 4) | 1         | 0x2        | Rotate Primary Register Left 16-bits                         |
| 1                 | \<Address> * 4 + (1 + int(\<Bits> / 16) % 4) | 1         | 0x2        | Rotate Primary Register Left 16-bits                         |

### Save
Saves the value stored in the Primary Register to the RAM at the specified address.

Syntax: `Save <Address>`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------- |
| 1           | \<Address> * 4     | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 2           | \<Address> * 4 + 3 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 3           | \<Address> * 4 + 2 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |
| 4           | \<Address> * 4 + 1 | 1         | 0x2        | Rotate Primary Register Left 16-bits              |

### SaveBitCounter
Saves the lower 10-bits stored in the Primary Register to the Bit Counter Register.

Syntax: `SaveBitCounter`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------- |
| 1           |                    | 0         | 0x9        | Write Bit Counter                                 |

### SaveBitsOff
Writes to RAM either the Bit Counter Register or the Comparator Register, whichever is one lower.

Syntax: `SaveBitsOff <Address>`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------- |
| 1           | \<Address> * 4     | 1         | 0xE        | Compare                                           |

### SaveComparator
Saves the lower 10-bits stored in the Secondary Register to the Comparator Register.

Syntax: `SaveComparator`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------- |
| 1           |                    | 0         | 0xA        | Write Comparator Register                         |

### SaveNonce
Saves to RAM either the Primary Register or Secondary Register value, depending on the values stored in the Bit Counter Register and Comparator Register. If `Bit Counter Register >= Comparator Register`, then the Secondary Register is stored in RAM at the specified address. If `Bit Counter Register < Comparator Register`, then the Primary Register is stored in RAM at the specified address.

Syntax: `SaveNonce <Address>`

Implementation:

| Instruction | RAM Address        | ALU Opcode | ALU Operation                                      |
| ----------- | ------------------ | ---------- | -------------------------------------------------- |
| 1           | \<Address> * 4     | 0xB        | Comparator Nonce Pass-through                      |
| 2           | Don't care         | 0x6        | Rotate Primary and Secondary Register Left 16-bits |
| 3           | \<Address> * 4 + 3 | 0xB        | Comparator Nonce Pass-through                      |
| 4           | Don't care         | 0x6        | Rotate Primary and Secondary Register Left 16-bits |
| 5           | \<Address> * 4 + 2 | 0xB        | Comparator Nonce Pass-through                      |
| 6           | Don't care         | 0x6        | Rotate Primary and Secondary Register Left 16-bits |
| 7           | \<Address> * 4 + 1 | 0xB        | Comparator Nonce Pass-through                      |
| 8           | Don't care         | 0x6        | Rotate Primary and Secondary Register Left 16-bits |

### XOR
XORs the value stored in the Primary Register with the value stored in the Secondary Register and stores it in the Primary Register.

Syntax: `XOR`

Implementation:

| Instruction | RAM Address        | RAM Write | ALU Opcode | ALU Operation                                     |
| ----------- | ------------------ | --------- | ---------- | ------------------------------------------------- |
| 1           | Don't care         | 0         | 0x7        | XOR                                               |
