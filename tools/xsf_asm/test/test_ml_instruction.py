import unittest
from xsf_asm.ml_instruction import MlInstruction


class TestMlInstruction(unittest.TestCase):
    def test_comment_only(self):
        ml = MlInstruction(
            address=None,
            ram_write=None,
            alu_opcode=None,
            input_select=None,
            output_select=None,
            output_enable=None,
            save_core_selection=None,
            comment="This has a comment."
        )

        self.assertTrue(ml.has_comment())
        self.assertFalse(ml.has_instruction())

    def test_instruction_only_none_comment(self):
        ml = MlInstruction(
            address=None,
            ram_write=0,
            alu_opcode=0x8,
            input_select=None,
            output_select=None,
            output_enable=0,
            save_core_selection=0,
            comment=None
        )

        self.assertFalse(ml.has_comment())
        self.assertTrue(ml.has_instruction())

    def test_instruction_only_blank_comment(self):
        ml = MlInstruction(
            address=None,
            ram_write=0,
            alu_opcode=0x8,
            input_select=None,
            output_select=None,
            output_enable=0,
            save_core_selection=0,
            comment=''
        )

        self.assertFalse(ml.has_comment())
        self.assertTrue(ml.has_instruction())

    def test_instruction_and_comment(self):
        ml = MlInstruction(
            address=None,
            ram_write=0,
            alu_opcode=0x8,
            input_select=None,
            output_select=None,
            output_enable=0,
            save_core_selection=0,
            comment="This has a comment!"
        )

        self.assertTrue(ml.has_comment())
        self.assertTrue(ml.has_instruction())


if __name__ == '__main__':
    unittest.main()
