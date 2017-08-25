from skein import SkeinGenerator, SkeinTypeValue

key = 0
tweak = 17
state = 20
nextstate = 37

expected_value = [
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

f = open("test/build/encrypt_test.asm", 'w')

sg = SkeinGenerator(f)

sg.select_core()
sg.initialize_key(key)
sg.initialize_plaintext(state, SkeinTypeValue.MESSAGE)

sg.encrypt(key, tweak, state, nextstate, SkeinTypeValue.MESSAGE)

# Check result
for (i, val) in enumerate(expected_value):
    sg.check_word_64(nextstate + i, val)

f.close()
