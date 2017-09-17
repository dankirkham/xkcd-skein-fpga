# Serial Communication

The FPGA uses RS232 to communicate with the host machine. On the FPGA, a Serial
Module is used to send, receive, and handle serial messages.

## Serial Message Format
Serial messages are sent using the following sequence:

1. Header Byte (0x9A)
2. Data Bytes

## Messages

### Nonce Seed
Data: `Nonce Seed (little-endian, 12 bytes)`

Sent from the host to the FPGA. This will shift-in the Nonce Seed value one
byte at a time. After receiving the 12-byte Nonce, the FPGA will set the
Nonce Initialized bit to high and start processing.

### Nonce Result
Data: `Status Byte`, `Best Nonce (little-endian, 16 bytes)`,
`CoreId (little-endian, 4 bytes)` and `Bits Off (little-endian, 2 bytes)`.

Periodically the FPGA will send this message. This will be the best hash
calculated since the last Nonce Result message was sent. The status byte has
the following bits:

| Position | Name               | Description                                                         |
| -------- | ------------------ | ------------------------------------------------------------------- |
| 0        | Nonce Initialized  | Nonce had been received by the FPGA and the FPGA is now processing. |
