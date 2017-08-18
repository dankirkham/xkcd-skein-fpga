import unittest
from xsf_asm.generate import Generator
from xsf_asm.asm_instruction import AsmInstruction


class TestGenerator(unittest.TestCase):
    def setUp(self):
        self.generator = Generator()

    def test_comment_only(self):
        asm_instructions = [AsmInstruction(None, None, "This is a comment!")]

        ml_instructions = self.generator.generate(asm_instructions)

        self.assertEqual("This is a comment!", ml_instructions[0].comment)

    def test_generate_save_nonce(self):
        asm_instructions = [AsmInstruction("SaveNonce", ["1"],
                                           "This is a comment!")]

        ml_instructions = self.generator.generate(asm_instructions)

        self.assertEqual("This is a comment!", ml_instructions[0].comment)
        self.assertEqual(8, len(ml_instructions))

    def test_no_generate_code_exists(self):
        asm_instructions = [AsmInstruction("Foo", ["Bar"], None)]

        self.assertRaises(NotImplementedError, self.generator.generate,
                          asm_instructions)

    def test_generate(self):
        asm_instructions = [
            AsmInstruction("Add", None, None),
            AsmInstruction("Constant", ['15'], None),
            AsmInstruction("CoreId", None, None),
            AsmInstruction("Count", None, None),
            AsmInstruction("Load", ['2', 'Primary'], None),
            AsmInstruction("Nonce", ['3'], None),
            AsmInstruction("Read", ['15'], None),
            AsmInstruction("RotateLeft", ['42', '1'], None),
            AsmInstruction("Save", ['5'], None),
            AsmInstruction("SaveBitCounter", None, None),
            AsmInstruction("SaveBitsOff", ['8'], None),
            AsmInstruction("SaveComparator", None, None),
            AsmInstruction("SaveNonce", ['6'], None),
            AsmInstruction("SelectCore", None, None),
            AsmInstruction("XOR", None, None),
        ]

        # No assertions here, just want no errors to occur.
        self.generator.generate(asm_instructions)


if __name__ == '__main__':
    unittest.main()
