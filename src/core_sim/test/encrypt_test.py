from skein import SkeinGenerator

key = 0
tweak = 17
subkey = 20
state = 21
nextstate = 37
plaintext = 53

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
sg.initialize_key(key, key)
sg.initialize_tweak(tweak, tweak)
sg.calculate_key_extend(key)
sg.calculate_tweak_extend(tweak)
sg.initialize_plaintext(state)
# sg.initialize_plaintext(plaintext)

for d in range(0, 80):
    if d % 4 == 0:
        for i in range(0, 16):
            sg.calculate_subkey_word(int(d / 4), i, key, tweak)
            f.write("Load {} Secondary\n".format(state + i))
            f.write("Add // Subkey Add\n")
            f.write("Save {}\n".format(nextstate + i))

        state, nextstate = nextstate, state

    for j in range(0, 8):
        sg.calculate_mix(d, j, state, nextstate)

    state, nextstate = nextstate, state

    sg.calculate_permute(state, nextstate)

    state, nextstate = nextstate, state

# Add last subkey
for i in range(0, 16):
    sg.calculate_subkey_word(20, i, key, tweak)
    f.write("Load {} Secondary\n".format(state + i))
    f.write("Add\n")
    f.write("Save {}\n".format(nextstate + i))

state, nextstate = nextstate, state

# XOR with plaintext
f.write("// CoreSimInput {}\n".format(0x4141414141414141))
f.write("Constant 0\n")
f.write("Load {} Secondary\n".format(state + 0))
f.write("XOR\n")
f.write("Save {}\n".format(state + 0))
f.write("// CoreSimInput {}\n".format(0x4141414141414141))
f.write("Constant 0\n")
f.write("Load {} Secondary\n".format(state + 1))
f.write("XOR\n")
f.write("Save {}\n".format(state + 1))
f.write("// CoreSimInput {}\n".format(0x0000000000424242))
f.write("Constant 0\n")
f.write("Load {} Secondary\n".format(state + 2))
f.write("XOR\n")
f.write("Save {}\n".format(state + 2))

# Check result
for (i, val) in enumerate(expected_value):
    sg.check_word_64(state + i, val)

f.close()
