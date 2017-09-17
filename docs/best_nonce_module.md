# Best Nonce Module

The best nonce module will read core-specific best nonce values from the main
bus and determine the chip-specific best nonce value. To do this, the module
uses the same `Save Selection` and `Output Enable` (in this case
`Output Active`) signals used by the cores.

The Best Nonce Module shares a block RAM with the Serial Module. Both modules
have ready signals that lock shared data.

## Memory Map
| Address (8-bit data)  | Address (16-bit data) | Size (bytes) | Description |
| --------------------- | --------------------- | ------------ | ----------- |
| 0x00                  | 0x0                   | 16           | Best Nonce  |
| 0x10                  | 0x8                   | 4*           | CoreId      |
| 0x14                  | 0xA                   | 2            | Bits Off    |

CoreId is 24 bits, but used 32 bits on RAM.

## IO Signals

### main_bus_i
64-bit input from the main bus.

### save_selection_i
Saves the current core selection to RAM. This also tells the Best Nonce Module
that core best bits and best nonce are about to be transmitted on the main bus.

### output_active_i
Tells the Best Nonce Module that either a core nonce or core bits off value is
on the bus.

### ram_i
16-bit input to block RAM.

### ram_o
16-bit output from block RAM.

### ram_write_o
RAM write signal

### ram_address_o
4-bit RAM address select

### ready_o
Best Nonce Module has stored a valid best nonce in the RAM and is not currently
accessing it.

### serial_module_ready_i
Serial module is currently busy sending the best nonce value.

### reset_best_nonce_i
Erase the best nonce value from RAM so that a new set of work can begin. This
will write a very high number to the best_bits_off address.
