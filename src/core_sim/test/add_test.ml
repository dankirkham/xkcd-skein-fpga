// CoreSimInput 10
00240 // Save '10' to RAM at Address 0
00e40
00a40
00640
// CoreSimInput 1337
01240 // Save '1337' to RAM at Address 1
01e40
01a40
01640
000c0 // Load Address 0 '10' to Primary Register
00c28
000c0
00828
000c0
00428
000c0
00028
000c0 // Load Address 1 '1337' to Secondary Register
01ca8
000c0
018a8
000c0
014a8
000c0
010a8
00100 // Add Primary and Secondary Register together
02e40 // RotateLeft 48 bits and store at 2
03a40
03640
03240
// CoreSimInput 0
00181 // Select the core
02186 // Read RAM at address 2
02586
02986
02d86
// CoreSimAssert 1347
