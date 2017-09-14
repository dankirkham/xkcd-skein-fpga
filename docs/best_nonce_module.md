# Best Nonce Module

The best nonce module will read core-specific best nonce values from the main
bus and determine the chip-specific best nonce value. To do this, the module
uses the same `Save Selection` and `Output Enable` (in this case
`Output Active`) signals used by the cores.

The Best Nonce Module shares a block RAM with the Serial Module. Both modules
have ready signals that lock shared data.


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
8-bit input to block RAM.

### ram_o
8-bit output from block RAM.

### ram_write_o
RAM write signal

### ready_o
Best Nonce Module has stored a valid best nonce in the RAM and is not currently
accessing it.

### serial_module_ready_i
Serial module is currently busy sending the best nonce value.

### reset_i
Erase the best nonce value from RAM so that a new set of work can begin.
