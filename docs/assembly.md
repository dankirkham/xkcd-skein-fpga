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

| Instruction | Address Bus        | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ----------- | ------------------ | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1           | Don't Care         | 0         | 0x8        | Don't Care   | Don't Care    | 0             | 0                   |

### Constant
Loads a 64-bit word from the Constants ROM at the specified address to the Primary Register.

Syntax: `Constant <Address>`

Implementation:

| Instruction | Address Bus        | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ----------- | ------------------ | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1           | <Address>          | 0         | 0x0        | 00           | Don't Care    | 0             | 0                   |

### CoreId
Loads the Core ID from the Core ID Module and stores it into the Primary Register.

Syntax: `CoreId`

Implementation:

| Instruction | Address Bus        | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ----------- | ------------------ | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1           | Don't Care         | 0         | 0x0        | 10           | Don't Care    | 0             | 0                   |

### Count
Increments the Bit Counter Register once for each one bit stored in the Primary Register. This counts the bits in one 64-bit word. For actual bits-off calculation, the Bit Counter Register must be zeroed, and then a `Load` instruction followed by a `Count` instruction must be repeated 16 times (to count all 1024 bits). Upon completion, the counted value will be stored in the Bit Counter Register.

Syntax: `Count`

Implementation:

| Instruction | Address Bus        | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ----------- | ------------------ | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1-64        | Don't Care         | 0         | 0x3        | Don't Care   | Don't Care    | 0             | 0                   |

### Load
Loads a 64-bit word from the RAM at the specified address to either the Primary or Secondary Register.

Syntax: `Load <Address> <Primary or Secondary>`

Implementation:

| Instruction | Address Bus        | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ----------- | ------------------ | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1           | Don't Care         | 0         | 0x6        | Don't Care   | Don't Care    | 0             | 0                   |
| 2           | \<Address> * 4 + 3 | 0         | 0x1 or 0x5 | 01           | Don't Care    | 0             | 0                   |
| 3           | Don't Care         | 0         | 0x6        | Don't Care   | Don't Care    | 0             | 0                   |
| 4           | \<Address> * 4 + 2 | 0         | 0x1 or 0x5 | 01           | Don't Care    | 0             | 0                   |
| 5           | Don't Care         | 0         | 0x6        | Don't Care   | Don't Care    | 0             | 0                   |
| 6           | \<Address> * 4 + 1 | 0         | 0x1 or 0x5 | 01           | Don't Care    | 0             | 0                   |
| 7           | Don't Care         | 0         | 0x6        | Don't Care   | Don't Care    | 0             | 0                   |
| 8           | \<Address> * 4     | 0         | 0x1 or 0x5 | 01           | Don't Care    | 0             | 0                   |

### Nonce
Loads a 64-bit nonce word at the specified address on the Nonce Module and stores it in the Primary Register.

Syntax: `Nonce <Address>`

Implementation:

| Instruction | Address Bus        | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ----------- | ------------------ | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1           | \<Address>         | 0         | 0x0        | 00           | Don't Care    | 0             | 0                   |

### Read
Outputs RAM value at specified address to the main bus.

Syntax: `Read <Address>`

Implementation:

| Instruction   | Address Bus            | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ------------- | ---------------------- | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1             | \<Address> * 4         | 0         | Don't Care | Don't Care   | 1             | 1             | 0                   |
| 2             | \<Address> * 4 + 1     | 0         | Don't Care | Don't Care   | 1             | 1             | 0                   |
| 3             | \<Address> * 4 + 2     | 0         | Don't Care | Don't Care   | 1             | 1             | 0                   |
| 4             | \<Address> * 4 + 3     | 0         | Don't Care | Don't Care   | 1             | 1             | 0                   |

### RotateLeft
Rotates left the value in the Primary Register and stores it to RAM. Since the ALU can rotate only 16-bits or 1-bit at a time, the machine-level implementation of this instruction can vary in length. For this reason, the "Instruction" column is replaced with a "Repetitions" column. **Caution:** The instruction voids the value stored in the Primary Register and Bit Counter Register. This is because the 16-bit rotations are actually RAM address manipulations and because of the "Rotate Primary Register Left 1-bit and Increment Bit Counter" ALU operation, respectively.

Syntax: `RotateLeft <Bits> <Address>`

Implementation:

| Repetitions   | Address Bus                                  | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ------------- | -------------------------------------------- | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| \<Bits mod 16 | Don't Care                                   | 0         | 0x3        | Don't Care   | Don't Care    | 0             | 0                   |
| 1             | \<Address> * 4 + int(\<Bits> / 16)           | 1         | 0x2        | Don't Care   | 0             | 0             | 0                   |
| 1             | \<Address> * 4 + (3 + int(\<Bits> / 16) % 4) | 1         | 0x2        | Don't Care   | 0             | 0             | 0                   |
| 1             | \<Address> * 4 + (2 + int(\<Bits> / 16) % 4) | 1         | 0x2        | Don't Care   | 0             | 0             | 0                   |
| 1             | \<Address> * 4 + (1 + int(\<Bits> / 16) % 4) | 1         | 0x2        | Don't Care   | 0             | 0             | 0                   |

### Save
Saves the value stored in the Primary Register to the RAM at the specified address.

Syntax: `Save <Address>`

Implementation:

| Instruction   | Address Bus            | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ------------- | ---------------------- | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1             | \<Address> * 4         | 1         | 0x2        | Don't Care   | 0             | 0             | 0                   |
| 2             | \<Address> * 4 + 3     | 1         | 0x2        | Don't Care   | 0             | 0             | 0                   |
| 3             | \<Address> * 4 + 2     | 1         | 0x2        | Don't Care   | 0             | 0             | 0                   |
| 4             | \<Address> * 4 + 1     | 1         | 0x2        | Don't Care   | 0             | 0             | 0                   |

### SaveBitCounter
Saves the lower 10-bits stored in the Primary Register to the Bit Counter Register.

Syntax: `SaveBitCounter`

Implementation:

| Instruction   | Address Bus            | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ------------- | ---------------------- | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1             | Don't Care             | 0         | 0x9        | Don't Care   | Don't Care    | 0             | 0                   |

### SaveBitsOff
Writes to RAM either the Bit Counter Register or the Comparator Register, whichever is one lower.

Syntax: `SaveBitsOff <Address>`

Implementation:

| Instruction   | Address Bus            | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ------------- | ---------------------- | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1             | \<Address> * 4         | 1         | 0xE        | Don't Care   | 0             | 0             | 0                   |

### SaveComparator
Saves the lower 10-bits stored in the Secondary Register to the Comparator Register.

Syntax: `SaveComparator`

Implementation:

| Instruction   | Address Bus            | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ------------- | ---------------------- | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1             | Don't Care             | 0         | 0xA        | Don't Care   | Don't Care    | 0             | 0                   |

### SaveNonce
Saves to RAM either the Primary Register or Secondary Register value, depending on the values stored in the Bit Counter Register and Comparator Register. If `Bit Counter Register >= Comparator Register`, then the Secondary Register is stored in RAM at the specified address. If `Bit Counter Register < Comparator Register`, then the Primary Register is stored in RAM at the specified address.

Syntax: `SaveNonce <Address>`

Implementation:

| Instruction | Address Bus        | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ----------- | ------------------ | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1           | \<Address> * 4     | 1         | 0xB        | Don't Care   | 0             | 0             | 0                   |
| 2           | Don't Care         | 0         | 0x6        | Don't Care   | Don't Care    | 0             | 0                   |
| 3           | \<Address> * 4 + 3 | 1         | 0xB        | Don't Care   | 0             | 0             | 0                   |
| 4           | Don't Care         | 0         | 0x6        | Don't Care   | Don't Care    | 0             | 0                   |
| 5           | \<Address> * 4 + 2 | 1         | 0xB        | Don't Care   | 0             | 0             | 0                   |
| 6           | Don't Care         | 0         | 0x6        | Don't Care   | Don't Care    | 0             | 0                   |
| 7           | \<Address> * 4 + 1 | 1         | 0xB        | Don't Care   | 0             | 0             | 0                   |
| 8           | Don't Care         | 0         | 0x6        | Don't Care   | Don't Care    | 0             | 0                   |

### SelectCore
Selects a core based on the value at the input of the cores, i.e. the main bus. A core that has a Core ID matching what is on the main bus will be selected. The "Read" assembly instruction will now work only on that particular core.

Syntax: `SelectCore`

Implementation:

| Instruction   | Address Bus            | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ------------- | ---------------------- | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1             | Don't Care             | 0         | Don't Care | Don't Care   | Don't Care    | 0             | 1                   |

### XOR
XORs the value stored in the Primary Register with the value stored in the Secondary Register and stores it in the Primary Register.

Syntax: `XOR`

Implementation:

| Instruction | Address Bus        | RAM Write | ALU Opcode | Input Select | Output Select | Output Enable | Save Core Selection |
| ----------- | ------------------ | --------- | ---------- | ------------ | ------------- | ------------- | ------------------- |
| 1           | Don't Care         | 0         | 0x7        | Don't Care   | Don't Care    | 0             | 0                   |
