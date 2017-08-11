// CoreSimInput 4645649
SelectCore // Select the core

// CoreSimInput 30108694065814591
Constant 0
Save 0

// CoreSimInput 8413635821569605209
Constant 1
Save 1

Load 0 Primary
Load 1 Secondary
XOR

RotateLeft 48 2 // RotateLeft 48 bits and store at 2
Read 2 // Read RAM at address 2
// CoreSimAssert 57958
