# From skein_iv.h
key = [
    0xD593DA0741E72355,
    0x15B5E511AC73E00C,
    0x5180E5AEBAF2C4F0,
    0x03BD41D3FCBCAFAF,
    0x1CAEC6FD1983A898,
    0x6E510B8BCDD0589F,
    0x77E2BDFDC6394ADA,
    0xC11E1DB524DCB0A3,
    0xD6D14AF9C6329AB5,
    0x6A9B0BFC6EB67E0D,
    0x9243C60DCCFF1332,
    0x1A1F1DDE743F02D4,
    0x0996753C10ED0BB8,
    0x6572DD22F2B4969A,
    0x61FD3062D00A579A,
    0x1DE0536E8682E539,
]

tweak = [
    64, # TODO: This is length of the plaintext in bytes.
    0xF000000000000000 # First = 1, Final = 1, and Type = Message
]

key_extend_word = 0x1BD11BDAA9FC1A22

base_key_pointer = 0;
base_tweak_pointer = len(key) + 1 # +1 because key gets extended
base_subkey_pointer = base_tweak_pointer + len(tweak) + 1 # +1 because tweak gets extended

expected_value = [
    0xd593da0741e72355,
    0x15b5e511ac73e00c,
    0x5180e5aebaf2c4f0,
    0x03bd41d3fcbcafaf,
    0x1caec6fd1983a898,
    0x6e510b8bcdd0589f,
    0x77e2bdfdc6394ada,
    0xc11e1db524dcb0a3,
    0xd6d14af9c6329ab5,
    0x6a9b0bfc6eb67e0d,
    0x9243c60dccff1332,
    0x1a1f1dde743f02d4,
    0x0996753c10ed0bb8,
    0x6572dd22f2b496da,
    0x51fd3062d00a579a,
    0x1de0536e8682e539
]

f = open("test/build/subkey_test.asm", 'w')

f.write("// CoreSimInput 4645649\n")
f.write("SelectCore // Select the core\n\n")

# Initialize the RAM
ptr = base_key_pointer
for word in key:
    f.write("// CoreSimInput {}\n".format(word))
    f.write("Constant 0\n")
    f.write("Save {}\n".format(ptr))
    ptr += 1

ptr = base_tweak_pointer
for word in tweak:
    f.write("// CoreSimInput {}\n".format(word))
    f.write("Constant 0\n")
    f.write("Save {}\n".format(ptr))
    ptr += 1

# Extend Key
f.write("Load 0 Primary\n")
for i in range(1, 16):
    f.write("Load {} Secondary\n".format(base_key_pointer + i))
    f.write("XOR\n")
f.write("Save {}\n".format(base_key_pointer + 16))
f.write("Load {} Secondary\n".format(base_key_pointer + 16))


f.write("// CoreSimInput {}\n".format(key_extend_word))
f.write("Constant 0\n")
f.write("XOR\n")
f.write("Save {}\n".format(base_key_pointer + 16))

# Extend Tweak
f.write("Load {} Primary\n".format(base_tweak_pointer))
f.write("Load {} Secondary\n".format(base_tweak_pointer + 1))
f.write("XOR\n")
f.write("Save {}\n".format(base_tweak_pointer + 2))

# Calculate subkey
s = 0
for i in range(0, 13):
    f.write("Load {} Primary\n".format(base_key_pointer + ((s + i) % 17)))
    f.write("Save {}\n".format(base_subkey_pointer + i))

f.write("Load {} Primary\n".format(base_key_pointer + ((s + 13) % 17)))
f.write("Load {} Secondary\n".format(base_tweak_pointer + (s % 3)))
f.write("Add\n")
f.write("Save {}\n".format(base_subkey_pointer + 13))

f.write("Load {} Primary\n".format(base_key_pointer + ((s + 14) % 17)))
f.write("Load {} Secondary\n".format(base_tweak_pointer + ((s + 1) % 3)))
f.write("Add\n")
f.write("Save {}\n".format(base_subkey_pointer + 14))

f.write("// CoreSimInput {}\n".format(s))
f.write("Constant 0\n")
f.write("Load {} Secondary\n".format(base_key_pointer + ((s + 15) % 17)))
f.write("Add\n")
f.write("Save {}\n".format(base_subkey_pointer + 15))

# Check value (corrupts subkey)
ptr = base_subkey_pointer
for word in expected_value:
    f.write("Read {}\n".format(ptr))
    f.write("// CoreSimAssert {}\n".format((word >> 48) & 0xFFFF))
    f.write("Load {} Primary\n".format(ptr))
    f.write("RotateLeft 16 {}\n".format(ptr))
    f.write("Read {}\n".format(ptr))
    f.write("// CoreSimAssert {}\n".format((word >> 32) & 0xFFFF))
    f.write("Load {} Primary\n".format(ptr))
    f.write("RotateLeft 16 {}\n".format(ptr))
    f.write("Read {}\n".format(ptr))
    f.write("// CoreSimAssert {}\n".format((word >> 16) & 0xFFFF))
    f.write("Load {} Primary\n".format(ptr))
    f.write("RotateLeft 16 {}\n".format(ptr))
    f.write("Read {}\n".format(ptr))
    f.write("// CoreSimAssert {}\n".format(word & 0xFFFF))
    ptr += 1

f.close()
