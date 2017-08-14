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

def select_core():
    """
    Selects the Core Simulator core so that it's outputs can be read.
    """
    f.write("// CoreSimInput 4645649\n")
    f.write("SelectCore // Select the core\n\n")

# Initialize the RAM
def initialize_key(key_ptr, constant_ptr):
    """
    Loads the key value from the Constants ROM to the RAM.

    Attributes:
    key_ptr -- Pointer to the first word in the key. Where the key should be
    stored in RAM.
    constant_ptr -- Pointer to the key stored in the Constants ROM.
    """
    for word in key:
        f.write("// CoreSimInput {}\n".format(word))
        f.write("Constant {}\n".format(constant_ptr))
        f.write("Save {}\n".format(key_ptr))
        key_ptr += 1
        constant_ptr += 1

def initialize_tweak(tweak_ptr, constant_ptr):
    """
    Loads the tweak value from the Constants ROM to RAM. This assumes that the
    tweak needed is stored continuously in the Constants ROM.

    Attributes:
    tweak_ptr -- Pointer to the first tweak value. This is where the tweak will
    be stored in RAM.
    constant_ptr -- Pointer to the tweak on the Constants ROM. This where the
    tweak will be loaded from.
    """
    for word in tweak:
        f.write("// CoreSimInput {}\n".format(word))
        f.write("Constant {}\n".format(constant_ptr))
        f.write("Save {}\n".format(tweak_ptr))
        tweak_ptr += 1
        constant_ptr += 1

def calculate_key_extend(key_ptr):
    """
    Calculates the 17th word for the key. To extend the key, all 16 words are
    XORed and then XORed by a constant 0x1BD11BDAA9FC1A22. Result is stored at
    key_ptr + 16

    Attributes:
    key_ptr -- Pointer to the key to be extended.
    """

    f.write("Load 0 Primary\n")
    for i in range(1, 16):
        f.write("Load {} Secondary\n".format(key_ptr + i))
        f.write("XOR\n")
    f.write("Save {}\n".format(key_ptr + 16))
    f.write("Load {} Secondary\n".format(key_ptr + 16))


    f.write("// CoreSimInput {}\n".format(key_extend_word)) # This is a constant
    f.write("Constant 0\n")
    f.write("XOR\n")
    f.write("Save {}\n".format(key_ptr + 16))

def calculate_tweak_extend(tweak_ptr):
    """
    Calculates the 3rd word for the tweak. To extend the tweak, the two other
    tweak words are XORed together. The result is stored at tweak_ptr + 2.

    Attributes:
    tweak_ptr -- Pointer to the tweak to be extended.
    """
    f.write("Load {} Primary\n".format(tweak_ptr))
    f.write("Load {} Secondary\n".format(tweak_ptr + 1))
    f.write("XOR\n")
    f.write("Save {}\n".format(tweak_ptr + 2))

def calculate_subkey_word(s, i, key_ptr, tweak_ptr):
    """
    Calculates the subkey word i for subkey s. Result is stored at Primary
    Register.

    Attributes:
    s -- subkey index
    i -- word index
    key_ptr -- pointer to first key word
    tweak_ptr -- pointer to first tweak word
    """

    if i < 13:
        f.write("Load {} Primary\n".format(key_ptr + ((s + i) % 17)))
    elif i == 13:
        f.write("Load {} Primary\n".format(key_ptr + ((s + 13) % 17)))
        f.write("Load {} Secondary\n".format(tweak_ptr + (s % 3)))
        f.write("Add\n")
    elif i == 14:
        f.write("Load {} Primary\n".format(key_ptr + ((s + 14) % 17)))
        f.write("Load {} Secondary\n".format(tweak_ptr + ((s + 1) % 3)))
        f.write("Add\n")
    elif i == 15:
        f.write("// CoreSimInput {}\n".format(s))
        f.write("Constant 0\n")
        f.write("Load {} Secondary\n".format(key_ptr + ((s + 15) % 17)))
        f.write("Add\n")

def check_word_64(address, expected_value):
    """
    Generates CoreSimAssert tests to check whether or not a value stored in RAM
    at address is equal to expected_value.

    Attributes:
    address -- Address in RAM of the value that is to be tested.
    expected_value -- 64-bit value to compare memory address with.
    """
    f.write("Read {}\n".format(address))
    f.write("// CoreSimAssert {}\n".format((expected_value >> 48) & 0xFFFF))
    f.write("Load {} Primary\n".format(address))
    f.write("RotateLeft 16 {}\n".format(address))
    f.write("Read {}\n".format(address))
    f.write("// CoreSimAssert {}\n".format((expected_value >> 32) & 0xFFFF))
    f.write("Load {} Primary\n".format(address))
    f.write("RotateLeft 16 {}\n".format(address))
    f.write("Read {}\n".format(address))
    f.write("// CoreSimAssert {}\n".format((expected_value >> 16) & 0xFFFF))
    f.write("Load {} Primary\n".format(address))
    f.write("RotateLeft 16 {}\n".format(address))
    f.write("Read {}\n".format(address))
    f.write("// CoreSimAssert {}\n".format(expected_value & 0xFFFF))

select_core()
initialize_key(base_key_pointer, base_key_pointer)
initialize_tweak(base_tweak_pointer, base_tweak_pointer)
calculate_key_extend(base_key_pointer)
calculate_tweak_extend(base_tweak_pointer)

s = 0
for i in range(0, 16):
    calculate_subkey_word(s, i, base_key_pointer, base_tweak_pointer)
    f.write("Save {}\n".format(base_subkey_pointer))
    check_word_64(base_subkey_pointer, expected_value[i])

f.close()
