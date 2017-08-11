def rotate_left(x, bits):
    return (((input_value << bits) | input_value >> 64 - bits) >> 48) & 0xFFFF

f = open('test/build/rotate_left_test.asm', 'w')

input_value = 0x76A9CEF522C494EB
address = 5

f.write("// CoreSimInput 0\n")
f.write("SelectCore // Select the core\n\n")

for bits in range(64):
    f.write("// CoreSimInput {}\n".format(input_value))
    f.write("Constant 0\n")
    f.write("RotateLeft {} {} // Bits: {}\n".format(bits, address, bits))
    f.write("Read {}\n".format(address))
    f.write("// CoreSimAssert {}\n\n".format(rotate_left(input_value, bits)))

f.close()

0x76A9CEF522C494EB
0xEB76A9CEF522C494
