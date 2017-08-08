// CoreSimInput 0
00181 // Select the core
// CoreSimInput 412
00240 // Save '412' to RAM at Address 0
00e40
00a40
00640
// CoreSimInput 414
01240 // Save '414' to RAM at Address 1
01e40
01a40
01640
000c0 // Load Address 0 '412' to Primary Register
00c28
000c0
00828
000c0
00428
000c0
00028
000c0 // Load Address 1 '414' to Secondary Register
01ca8
000c0
018a8
000c0
014a8
000c0
010a8
00120 // Save Primary Register value to Bit Counter '412'
00140 // Save Secondary Register value to Comparator Register '414'
// CoreSimInput 2301902359540000000
02240 // Save '2301902359540000000' to RAM at Address 2
02e40
02a40
02640
// CoreSimInput 677000000000000
03240 // Save '677000000000000' to RAM at Address 3
03e40
03a40
03640
000c0 // Load 2301902359540000000 to Primary Register
02c28
000c0
02828
000c0
02428
000c0
02028
000c0 // Load 677000000000000 to Secondary Register
03ca8
000c0
038a8
000c0
034a8
000c0
030a8
053c0 // Save Lowest Bits Off to RAM
06360 // Save Nonce to RAM
000c0
06f60
000c0
06b60
000c0
06760
000c0
000c0 // Load Lowest Bits Off to RAM
05c28
000c0
05828
000c0
05428
000c0
05028
05e40 // RotateLeft 48 bits and store at 2
06a40
06640
06240
05186 // Read RAM at address 2
05586
05986
05d86
// CoreSimAssert 412
06186 // Read Nonce Saved at Address 6
06586
06986
06d86
// CoreSimAssert 8178
