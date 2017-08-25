"""
Module for generation xkcd-skein-fpga code for Skein hash function calculation.
"""
from enum import Enum
from skein_constants import SkeinConstants as Constants


class SkeinTypeValue(Enum):
    MESSAGE = 0,
    OUTPUT = 1


class SkeinGenerator():
    plaintext_nonce_word = 0x4141414141414141

    def __init__(self, f):
        self.f = f

    def select_core(self):
        """
        Selects the Core Simulator core so that it's outputs can be read.
        """
        self.f.write("// CoreSimInput 4342338\n")
        self.f.write("SelectCore // Select the core\n\n")

    def initialize_key(self, key):
        """
        Loads the key value from the Constants ROM to the RAM.

        Attributes:
        key -- Pointer to the first word in the key. Where the key should
        be stored in RAM.
        """
        for i in range(0, 16):
            self.f.write(
                "// CoreSimInput {} // Key Word: {}\n".format(
                    Constants.c[Constants.SKEIN_IV + i], i
                )
            )
            self.f.write("Constant {}\n".format(Constants.SKEIN_IV + i))
            self.f.write("Save {}\n".format(key + i))

    def initialize_tweak(self, tweak, constant, type_value):
        """
        Loads the tweak value from the Constants ROM to RAM. This assumes that
        the tweak needed is stored continuously in the Constants ROM.

        Attributes:
        tweak -- Pointer to the first tweak value. This is where the tweak
        will be stored in RAM.
        constant -- Pointer to the tweak on the Constants ROM. This where
        the tweak will be loaded from.
        type_value -- type of message being encrypted (whitepaper 3.5.1)
        """

        if type_value == SkeinTypeValue.MESSAGE:
            tweak_words = [
                Constants.MESSAGE_TWEAK_0,
                Constants.MESSAGE_TWEAK_1
            ]
        else:  # type_value == SkeinTypeValue.OUTPUT
            tweak_words = [
                Constants.OUTPUT_TWEAK_0,
                Constants.OUTPUT_TWEAK_1
            ]

        for i in range(2):
            self.f.write("// CoreSimInput {} // Tweak Word {}\n".format(
                Constants.c[tweak_words[i]], i
            ))
            self.f.write("Constant {}\n".format(tweak_words[i]))
            self.f.write("Save {}\n".format(tweak + i))

    def initialize_plaintext(self, state, type_value):
        """
        Loads initial plaintext value into RAM at state.

        Attributes:
        state -- Pointer to where the plaintext should be loaded.
        type_value -- Type of message being encrypted (whitepaper 3.5.1)
        """
        if type_value == SkeinTypeValue.MESSAGE:
            # Initialize Nonce
            for index in range(2):
                self.f.write("// CoreSimInput {}\n".format(
                    SkeinGenerator.plaintext_nonce_word
                ))
                self.f.write("Nonce {}\n".format(index))
                self.f.write("Save {}\n".format(state + index))

            # Initialize Core ID
            self.f.write("CoreId // CoreId\n")
            self.f.write("Save {}\n".format(state + 2))

            zeros_start = 3
        else:  # type_value == SkeinTypeValue.OUTPUT
            zeros_start = 0

        # Fill in with zeros
        for index in range(zeros_start, 16):
            self.f.write("// CoreSimInput 0\n")
            self.f.write("Constant 0 // Plaintext {}\n".format(index))
            self.f.write("Save {}\n".format(state + index))

    def calculate_key_extend(self, key):
        """
        Calculates the 17th word for the key. To extend the key, all 16 words
        are XORed and then XORed by a constant 0x1BD11BDAA9FC1A22. Result is
        stored at key + 16

        Attributes:
        key -- Pointer to the key to be extended.
        """

        self.f.write("Load {} Primary\n".format(key))
        for i in range(1, 16):
            self.f.write("Load {} Secondary\n".format(key + i))
            self.f.write("XOR\n")
        self.f.write("Save {}\n".format(key + 16))
        self.f.write("Load {} Secondary\n".format(key + 16))

        self.f.write(
            "// CoreSimInput {}\n".format(Constants.c[Constants.KEY_EXTEND])
        )  # This is a constant
        self.f.write("Constant {}\n".format(Constants.KEY_EXTEND))
        self.f.write("XOR\n")
        self.f.write("Save {}\n".format(key + 16))

    def calculate_tweak_extend(self, tweak):
        """
        Calculates the 3rd word for the tweak. To extend the tweak, the two
        other tweak words are XORed together. The result is stored at tweak
        + 2.

        Attributes:
        tweak -- Pointer to the tweak to be extended.
        """

        self.f.write("Load {} Primary\n".format(tweak))
        self.f.write("Load {} Secondary\n".format(tweak + 1))
        self.f.write("XOR\n")
        self.f.write("Save {}\n".format(tweak + 2))

    def calculate_subkey_word(self, s, i, key, tweak):
        """
        Calculates the subkey word i for subkey s. Result is stored at Primary
        Register.

        Attributes:
        s -- subkey index
        i -- word index
        key -- pointer to first key word
        tweak -- pointer to first tweak word
        """

        if i < 13:
            self.f.write(
                "Load {} Primary // Subkey in Primary Register\n".format(
                    key + ((s + i) % 17)
                )
            )
        elif i == 13:
            self.f.write("Load {} Primary\n".format(key + ((s + 13) % 17)))
            self.f.write("Load {} Secondary\n".format(tweak + (s % 3)))
            self.f.write("Add // Subkey in Primary Register\n")
        elif i == 14:
            self.f.write("Load {} Primary\n".format(key + ((s + 14) % 17)))
            self.f.write("Load {} Secondary\n".format(
                tweak + ((s + 1) % 3))
            )
            self.f.write("Add // Subkey in Primary Register\n")
        elif i == 15:
            self.f.write("// CoreSimInput {}\n".format(s))
            self.f.write("Constant {}\n".format(Constants.c[s]))
            self.f.write("Load {} Secondary\n".format(
                key + ((s + 15) % 17))
            )
            self.f.write("Add // Subkey in Primary Register\n")

    def check_word_64(self, address, expected_value):
        """
        Generates CoreSimAssert tests to check whether or not a value stored in
        RAM at address is equal to expected_value.

        Attributes:
        address -- Address in RAM of the value that is to be tested.
        expected_value -- 64-bit value to compare memory address with.
        """
        self.f.write("Read {}\n".format(address))
        self.f.write("// CoreSimAssert {}\n".format(
            (expected_value >> 48) & 0xFFFF)
        )
        self.f.write("Load {} Primary\n".format(address))
        self.f.write("RotateLeft 16 {}\n".format(address))
        self.f.write("Read {}\n".format(address))
        self.f.write("// CoreSimAssert {}\n".format(
            (expected_value >> 32) & 0xFFFF)
        )
        self.f.write("Load {} Primary\n".format(address))
        self.f.write("RotateLeft 16 {}\n".format(address))
        self.f.write("Read {}\n".format(address))
        self.f.write("// CoreSimAssert {}\n".format(
            (expected_value >> 16) & 0xFFFF)
        )
        self.f.write("Load {} Primary\n".format(address))
        self.f.write("RotateLeft 16 {}\n".format(address))
        self.f.write("Read {}\n".format(address))
        self.f.write("// CoreSimAssert {}\n".format(expected_value & 0xFFFF))

    def calculate_mix(self, d, j, state, nextstate):
        """Skein Mix function from whitepaper 3.3.1

        Attributes:
        d -- Round counter
        j -- j from mix function
        state -- Pointer to state used as input
        nextstate -- Pointer to state used as output
        """
        # Calculate Pointers
        x0 = state + (2 * j)
        x1 = state + (2 * j) + 1
        y0 = nextstate + (2 * j)
        y1 = nextstate + (2 * j) + 1

        # Calculate y0
        self.f.write("Load {} Primary\n".format(x1))
        self.f.write("Load {} Secondary\n".format(x0))
        self.f.write("Add\n")

        # Save y0
        self.f.write("Save {} // {}, d = {}, j = {}\n".format(y0, y0, d, j))

        # Reload x1, because Add corrupts Primary Register
        self.f.write("Load {} Primary\n".format(x1))

        # Rotate, memory access required :(
        self.f.write("RotateLeft {} {} // RotateLeft\n".format(
            self.rotation_constant(d, j), y1)
        )

        # x1 rotated ^ y0
        self.f.write(
            "Load {} Primary // x1 rotated\n".format(y1)
        )  # x1 rotated
        self.f.write("Load {} Secondary\n".format(y0))
        self.f.write("XOR // XOR\n")

        # Save y1
        self.f.write("Save {}\n".format(y1))

    def calculate_permute(self, state, nextstate):
        """Performs Skein word permutation from whitepaper Table 3

        Attributes:
        state -- Pointer to state used as input
        nextstate -- Pointer to state used as output
        """

        permute_lut = [
            0, 9, 2, 13, 6, 11, 4, 15, 10, 7, 12, 3, 14, 5, 8, 1
        ]

        for (destination, source) in enumerate(permute_lut):
            self.f.write("Load {} Primary\n".format(state + source))
            self.f.write("Save {}\n".format(nextstate + destination))

    def add_subkey_word(self, s, i, key, tweak, state, nextstate):
        """Adds subkey word to the current state word and stores it at the
        nextstate pointer.

        Attributes:
        s -- subkey index
        i -- word index
        key -- pointer to first key word
        tweak -- pointer to first tweak word
        state -- pointer to current state
        nextstate -- pointer to next state, where result is saved
        """
        self.calculate_subkey_word(s, i, key, tweak)
        self.f.write("Load {} Secondary\n".format(state + i))
        self.f.write("Add\n")
        self.f.write("Save {}\n".format(nextstate + i))

    def add_subkey(self, s, key, tweak, state, nextstate):
        """Adds the subkey s to the current state. Output will be at state.

        Attributes:
        s -- subkey index
        key -- pointer to first key word
        tweak -- pointer to first tweak word
        state -- pointer to current state
        nextstate -- pointer to next state, where result is saved
        """
        for i in range(0, 16):
            self.add_subkey_word(s, i, key, tweak, state, nextstate)

    def encrypt(self, key, tweak, state, nextstate,
                type_value: SkeinTypeValue):
        """Threefish block cipher encrypt function. Result is stored at
        nextstate.

        Attributes:
        key -- pointer to key
        tweak -- pointer to tweak
        state -- pointer to initial state (plaintext)
        nextstate -- pointer to next state (needed because the implementation
        alternates between the state and nextstate pointer)
        type_value -- type of message being encrypted (whitepaper 3.5.1)
        """

        self.initialize_tweak(tweak, tweak, type_value)
        self.calculate_key_extend(key)
        self.calculate_tweak_extend(tweak)

        for d in range(0, 80):
            if d % 4 == 0:
                self.add_subkey(int(d / 4), key, tweak, state, nextstate)

                state, nextstate = nextstate, state

            for j in range(0, 8):
                self.calculate_mix(d, j, state, nextstate)

            state, nextstate = nextstate, state

            self.calculate_permute(state, nextstate)

            state, nextstate = nextstate, state

        # Add last subkey
        self.add_subkey(20, key, tweak, state, nextstate)

        state, nextstate = nextstate, state

        # XOR with plaintext
        if type_value == SkeinTypeValue.MESSAGE:
            for i in range(2):
                self.f.write("// CoreSimInput {}\n".format(
                    SkeinGenerator.plaintext_nonce_word
                ))
                self.f.write("Nonce {}\n".format(i))
                self.f.write("Load {} Secondary\n".format(state + i))
                self.f.write("XOR\n")
                self.f.write("Save {}\n".format(state + i))

            self.f.write("CoreId\n")
            self.f.write("Load {} Secondary\n".format(state + 2))
            self.f.write("XOR\n")
            self.f.write("Save {}\n".format(state + 2))

        return state

    def count_bits_off(self, state, result):
        """Counts the number of bits that the 16-word hash is from the xkcd
        provided target.

        Attributes:
        state -- pointer to the first word in the 16-word result.
        result -- pointer to the one word result that is the bit count.
        """
        # Zero bit counter
        self.f.write("// CoreSimInput 0\n")
        self.f.write("Constant 0\n")
        self.f.write("SaveBitCounter\n")

        for i in range(16):
            self.f.write("// CoreSimInput {}\n".format(
                Constants.c[Constants.XKCD + i]
            ))
            self.f.write("Constant {}\n".format(Constants.XKCD + i))
            self.f.write("Load {} Secondary\n".format(state + i))
            self.f.write("XOR\n")
            self.f.write("Count\n")

        self.f.write("SaveBitsOff {}\n".format(result))

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
