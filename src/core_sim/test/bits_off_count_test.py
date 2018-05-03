from skein import SkeinGenerator

state = 0
bits_off = 40

hash_result = [
    0x929e8e3169cbd68b,
    0x84af36b812cc2442,
    0xa2a6bf36db04a29d,
    0x29bd9ec675ae7151,
    0x9ffddc3ed0098f76,
    0x880176525044f3d6,
    0xa11450e8859f7adc,
    0xa77d0428d216aeae,
    0x618ed3f431a9f5af,
    0x08d73dc5094591e4,
    0x56c8ee5e50006c58,
    0x2172838faabd410f,
    0x3acc0c87f95eae38,
    0x1ed16982db2979b5,
    0x3087d22f0fc7b53b,
    0x71802626662ab09c
]

f = open("test/build/bits_off_count_test.asm", 'w+')

sg = SkeinGenerator(f)

sg.select_core()

# Initialize result in RAM
for (index, val) in enumerate(hash_result):
    f.write("// CoreSimInput {}\n".format(hex(val)))
    f.write("Constant {}\n".format(index))
    f.write("Save {}\n".format(state + index))

# Count the bits
sg.count_bits_off(state, bits_off)

sg.check_word_64(bits_off, 502)

f.close()
