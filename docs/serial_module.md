# Serial Module

The Serial Module sends and receives data to the host machine. It shares a
block RAM with the Best Nonce Module. Both modules have ready signals that lock
shared data.

## IO Signals

### rx_byte_i
Byte received from UART.

### new_rx_byte_i
rx_byte_i is a newly received byte.

### tx_byte_o
Byte to transmit over UART.

### new_tx_byte_o
Notifies serial transmitter that a new byte is ready to send.

### tx_busy_i
Serial transmitter is busy sending a byte.

### nonce_byte_o
Byte to be shifted into Nonce Module.

### nonce_shift_in_o
Shift byte into Nonce Module.

### nonce_ready_o
Nonce is done being shifted in and is ready for use.

### ready_o
When HIGH, Serial Module is not using the best nonce value in RAM.

### best_nonce_module_ready_i
When HIGH, the Best Nonce Module is not using the best nonce value in RAM.
