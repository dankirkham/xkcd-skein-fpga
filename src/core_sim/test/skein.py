"""
Module for generation xkcd-skein-fpga code for Skein hash function calculation.
"""

class SkeinGenerator():
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
        19, # TODO: This is length of the plaintext in bytes.
        0xF000000000000000 # First = 1, Final = 1, and Type = Message
    ]

    plaintext = [
        0x4141414141414141,
        0x4141414141414141,
        0x0000000000424242,
        0x0000000000000000,
        0x0000000000000000,
        0x0000000000000000,
        0x0000000000000000,
        0x0000000000000000,
        0x0000000000000000,
        0x0000000000000000,
        0x0000000000000000,
        0x0000000000000000,
        0x0000000000000000,
        0x0000000000000000,
        0x0000000000000000,
        0x0000000000000000
    ]

    key_extend_word = 0x1BD11BDAA9FC1A22

    def __init__(self, f):
        self.f = f


    def select_core(self):
        """
        Selects the Core Simulator core so that it's outputs can be read.
        """
        self.f.write("// CoreSimInput 4645649\n")
        self.f.write("SelectCore // Select the core\n\n")

    def initialize_key(self, key_ptr, constant_ptr):
        """
        Loads the key value from the Constants ROM to the RAM.

        Attributes:
        key_ptr -- Pointer to the first word in the key. Where the key should be
        stored in RAM.
        constant_ptr -- Pointer to the key stored in the Constants ROM.
        """
        for word in SkeinGenerator.key:
            self.f.write("// CoreSimInput {}\n".format(word))
            self.f.write("Constant {}\n".format(constant_ptr))
            self.f.write("Save {}\n".format(key_ptr))
            key_ptr += 1
            constant_ptr += 1

    def initialize_tweak(self, tweak_ptr, constant_ptr):
        """
        Loads the tweak value from the Constants ROM to RAM. This assumes that the
        tweak needed is stored continuously in the Constants ROM.

        Attributes:
        tweak_ptr -- Pointer to the first tweak value. This is where the tweak will
        be stored in RAM.
        constant_ptr -- Pointer to the tweak on the Constants ROM. This where the
        tweak will be loaded from.
        """
        for word in SkeinGenerator.tweak:
            self.f.write("// CoreSimInput {}\n".format(word))
            self.f.write("Constant {}\n".format(constant_ptr))
            self.f.write("Save {}\n".format(tweak_ptr))
            tweak_ptr += 1
            constant_ptr += 1

    def initialize_plaintext(self, state_ptr):
        """
        Loads initial plaintext value into RAM at state_ptr.

        TODO: This currently loads fixed constants. In the real hardware this
        requires loading the Nonce and CoreId from their appropriate registers.

        Attributes:
        state_ptr -- Pointer to where the plaintext should be loaded.
        """

        for word in SkeinGenerator.plaintext:
            self.f.write("// CoreSimInput {}\n".format(word))
            self.f.write("Constant 0\n")
            self.f.write("Save {}\n".format(state_ptr))
            state_ptr += 1

    def calculate_key_extend(self, key_ptr):
        """
        Calculates the 17th word for the key. To extend the key, all 16 words are
        XORed and then XORed by a constant 0x1BD11BDAA9FC1A22. Result is stored at
        key_ptr + 16

        Attributes:
        key_ptr -- Pointer to the key to be extended.
        """

        self.f.write("Load 0 Primary\n")
        for i in range(1, 16):
            self.f.write("Load {} Secondary\n".format(key_ptr + i))
            self.f.write("XOR\n")
        self.f.write("Save {}\n".format(key_ptr + 16))
        self.f.write("Load {} Secondary\n".format(key_ptr + 16))


        self.f.write("// CoreSimInput {}\n".format(SkeinGenerator.key_extend_word)) # This is a constant
        self.f.write("Constant 0\n")
        self.f.write("XOR\n")
        self.f.write("Save {}\n".format(key_ptr + 16))

    def calculate_tweak_extend(self, tweak_ptr):
        """
        Calculates the 3rd word for the tweak. To extend the tweak, the two other
        tweak words are XORed together. The result is stored at tweak_ptr + 2.

        Attributes:
        tweak_ptr -- Pointer to the tweak to be extended.
        """
        self.f.write("Load {} Primary\n".format(tweak_ptr))
        self.f.write("Load {} Secondary\n".format(tweak_ptr + 1))
        self.f.write("XOR\n")
        self.f.write("Save {}\n".format(tweak_ptr + 2))

    def calculate_subkey_word(self, s, i, key_ptr, tweak_ptr):
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
            self.f.write("Load {} Primary\n".format(key_ptr + ((s + i) % 17)))
        elif i == 13:
            self.f.write("Load {} Primary\n".format(key_ptr + ((s + 13) % 17)))
            self.f.write("Load {} Secondary\n".format(tweak_ptr + (s % 3)))
            self.f.write("Add\n")
        elif i == 14:
            self.f.write("Load {} Primary\n".format(key_ptr + ((s + 14) % 17)))
            self.f.write("Load {} Secondary\n".format(tweak_ptr + ((s + 1) % 3)))
            self.f.write("Add\n")
        elif i == 15:
            self.f.write("// CoreSimInput {}\n".format(s))
            self.f.write("Constant 0\n")
            self.f.write("Load {} Secondary\n".format(key_ptr + ((s + 15) % 17)))
            self.f.write("Add\n")

    def check_word_64(self, address, expected_value):
        """
        Generates CoreSimAssert tests to check whether or not a value stored in RAM
        at address is equal to expected_value.

        Attributes:
        address -- Address in RAM of the value that is to be tested.
        expected_value -- 64-bit value to compare memory address with.
        """
        self.f.write("Read {}\n".format(address))
        self.f.write("// CoreSimAssert {}\n".format((expected_value >> 48) & 0xFFFF))
        self.f.write("Load {} Primary\n".format(address))
        self.f.write("RotateLeft 16 {}\n".format(address))
        self.f.write("Read {}\n".format(address))
        self.f.write("// CoreSimAssert {}\n".format((expected_value >> 32) & 0xFFFF))
        self.f.write("Load {} Primary\n".format(address))
        self.f.write("RotateLeft 16 {}\n".format(address))
        self.f.write("Read {}\n".format(address))
        self.f.write("// CoreSimAssert {}\n".format((expected_value >> 16) & 0xFFFF))
        self.f.write("Load {} Primary\n".format(address))
        self.f.write("RotateLeft 16 {}\n".format(address))
        self.f.write("Read {}\n".format(address))
        self.f.write("// CoreSimAssert {}\n".format(expected_value & 0xFFFF))

    def rotation_constant(self, d_raw, j):
        """
        Skein Rotation Constants. See whitepaper 3.3.1.

        Attributes:
        d_raw -- Skein round
        j -- j from whitepaper 3.3
        """
        d = d_raw % 8
        if d == 0:
            if j == 0:
                return 24
            elif j == 1:
                return 13
            elif j == 2:
                return 8
            elif j == 3:
                return 47
            elif j == 4:
                return 8
            elif j == 5:
                return 17
            elif j == 6:
                return 22
            else:
                return 37
        elif d == 1:
            if j == 0:
                return 38
            elif j == 1:
                return 19
            elif j == 2:
                return 10
            elif j == 3:
                return 55
            elif j == 4:
                return 49
            elif j == 5:
                return 18
            elif j == 6:
                return 23
            else:
                return 52
        elif d == 2:
            if j == 0:
                return 33
            elif j == 1:
                return 4
            elif j == 2:
                return 51
            elif j == 3:
                return 13
            elif j == 4:
                return 34
            elif j == 5:
                return 41
            elif j == 6:
                return 59
            else:
                return 17
        elif d == 3:
            if j == 0:
                return 5
            elif j == 1:
                return 20
            elif j == 2:
                return 48
            elif j == 3:
                return 41
            elif j == 4:
                return 47
            elif j == 5:
                return 28
            elif j == 6:
                return 16
            else:
                return 25
        elif d == 4:
            if j == 0:
                return 41
            elif j == 1:
                return 9
            elif j == 2:
                return 37
            elif j == 3:
                return 31
            elif j == 4:
                return 12
            elif j == 5:
                return 47
            elif j == 6:
                return 44
            else:
                return 30
        elif d == 5:
            if j == 0:
                return 16
            elif j == 1:
                return 34
            elif j == 2:
                return 56
            elif j == 3:
                return 51
            elif j == 4:
                return 4
            elif j == 5:
                return 53
            elif j == 6:
                return 42
            else:
                return 41
        elif d == 6:
            if j == 0:
                return 31
            elif j == 1:
                return 44
            elif j == 2:
                return 47
            elif j == 3:
                return 46
            elif j == 4:
                return 19
            elif j == 5:
                return 42
            elif j == 6:
                return 44
            else:
                return 25
        else:
            if j == 0:
                return 9
            elif j == 1:
                return 48
            elif j == 2:
                return 35
            elif j == 3:
                return 52
            elif j == 4:
                return 23
            elif j == 5:
                return 31
            elif j == 6:
                return 37
            else:
                return 20

    def calculate_mix(self, d, j, state_ptr, next_state_ptr):
        """Skein Mix function from whitepaper 3.3.1

        Attributes:
        d -- Round counter
        j -- j from mix function
        state_ptr -- Pointer to state used as input
        next_state_ptr -- Pointer to state used as output
        """
        # Calculate Pointers
        x0 = state_ptr + (2 * j)
        x1 = state_ptr + (2 * j) + 1
        y0 = next_state_ptr + (2 * j)
        y1 = next_state_ptr + (2 * j) + 1

        # Calculate y0
        self.f.write("Load {} Primary\n".format(x1))
        self.f.write("Load {} Secondary\n".format(x0))
        self.f.write("Add\n")

        # Save y0
        self.f.write("Save {}\n".format(y0))

        # Reload x1, because Add corrupts Primary Register
        self.f.write("Load {} Primary\n".format(x1))

        # Rotate, memory access required :(
        self.f.write("RotateLeft {} {} // RotateLeft\n".format(self.rotation_constant(d, j), y1))

        # x1 rotated ^ y0
        self.f.write("Load {} Primary // x1 rotated\n".format(y1)) # x1 rotated
        self.f.write("Load {} Secondary\n".format(y0))
        self.f.write("XOR // XOR\n")

        # Save y1
        self.f.write("Save {}\n".format(y1))

    def calculate_permute(self, state_ptr, next_state_ptr):
        """Performs Skein word permutation from whitepaper Table 3

        Attributes:
        state_ptr -- Pointer to state used as input
        next_state_ptr -- Pointer to state used as output
        """

        permute_lut = [
            0, 9, 2, 13, 6, 11, 4, 15, 10, 7, 12, 3, 14, 5, 8, 1
        ]

        for (source, destination) in enumerate(permute_lut):
            self.f.write("Load {} Primary\n".format(state_ptr + source))
            self.f.write("Save {}\n".format(next_state_ptr + destination))
