// CoreSimInput 4342338
SelectCore // Select the core
// CoreSimInput 10
Constant 0
Save 0 // Save '10' to RAM at Address 0
// CoreSimInput 1337
Constant 1
Save 1 // Save '1337' to RAM at Address 1
Load 0 Primary // Load Address 0 '10' to Primary Register
Load 1 Secondary // Load Address 1 '1337' to Secondary Register
Add // Add Primary and Secondary Register together
RotateLeft 48 2 // RotateLeft 48 bits and store at 2
Read 2 // Read RAM at address 2
// CoreSimAssert 1347 It should add 1337 to 10 and get 1347
