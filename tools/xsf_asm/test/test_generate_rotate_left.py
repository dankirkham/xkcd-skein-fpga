import unittest
from xsf_asm.generate.instructions.generate_rotate_left import generate_rotate_left
from  xsf_asm.asm_instruction import AsmInstruction

class TestGenerator(unittest.TestCase):
    def setUp(self):
        self.ml_instructions = []

    def test_not_mod_16_comment(self):
        """If the <Bits> operand for the RotateLeft instruction is not a
        multiple of 16, the comment should go on the first "Rotate Left 1-bit"
        ALU operation machine-language instruction.
        """
        asm_instruction = AsmInstruction("RotateLeft", ["14", '1'], "This is a comment!")

        generate_rotate_left(asm_instruction, self.ml_instructions)

        # First instruction has comment, all other instructions have no comment
        self.assertIsNotNone(self.ml_instructions[0].comment)

        for ml in self.ml_instructions[1:]:
            self.assertIsNone(ml.comment)

    def test_mod_16_comment(self):
        """If the <Bits> operand fot the RotateLeft instruction is a multiple
        of 16, the comment should go on the first RAM Write machine-language
        instruction.
        """

        asm_instruction = AsmInstruction("RotateLeft", ["32", '1'], "This is a comment!")

        generate_rotate_left(asm_instruction, self.ml_instructions)

        # First instruction has comment, all other instructions have no comment
        self.assertIsNotNone(self.ml_instructions[0].comment)

        for ml in self.ml_instructions[1:]:
            self.assertIsNone(ml.comment)

if __name__ == '__main__':
    unittest.main()
