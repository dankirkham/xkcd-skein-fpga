// CoreSimInput 4342338
SelectCore // Select the core
// CoreSimInput 412
Constant 0
Save 0 // Save '412' to RAM at Address 0
// CoreSimInput 414
Constant 1
Save 1 // Save '414' to RAM at Address 1
Load 0 Primary // Load Address 0 '412' to Primary Register
Load 1 Secondary // Load Address 1 '414' to Secondary Register
SaveBitCounter // Save Primary Register value to Bit Counter '412'
SaveComparator // Save Secondary Register value to Comparator Register '414'
// CoreSimInput 2301902359540000000
Constant 2
Save 2 // Save '2301902359540000000' to RAM at Address 2
// CoreSimInput 677000000000000
Constant 3
Save 3 // Save '677000000000000' to RAM at Address 3
Load 2 Primary // Load 2301902359540000000 to Primary Register
Load 3 Secondary // Load 677000000000000 to Secondary Register
SaveBitsOff 5 // Save Lowest Bits Off to RAM
SaveNonce 6 // Save Nonce to RAM
Load 5 Primary // Load Lowest Bits Off to RAM
RotateLeft 48 5 // RotateLeft 48 bits and store at 2
Read 5 // Read RAM at address 2
// CoreSimAssert 412
Read 6 // Read Nonce Saved at Address 6
// CoreSimAssert 8178
