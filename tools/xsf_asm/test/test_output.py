import io
import unittest
from xsf_asm.output import Outputter
from xsf_asm.ml_instruction import MlInstruction


class TestMlInstruction(unittest.TestCase):
    def setUp(self):
        self.output = io.StringIO()
        self.outputter = Outputter()

    def test_output(self):
        instructions = [
            MlInstruction(
                address=None,
                ram_write=0,
                alu_opcode=0x8,
                input_select=None,
                output_select=None,
                output_enable=0,
                save_core_selection=0,
                comment=None,
                global_command=0
            ),
            MlInstruction(
                address=None,
                ram_write=None,
                alu_opcode=None,
                input_select=None,
                output_select=None,
                output_enable=None,
                save_core_selection=None,
                comment="This has a comment.",
                global_command=None
            ),
            MlInstruction(
                address=None,
                ram_write=0,
                alu_opcode=0x8,
                input_select=None,
                output_select=None,
                output_enable=0,
                save_core_selection=0,
                comment="This has a comment!",
                global_command=0
            ),
            MlInstruction(
                address=0xFF,
                ram_write=0,
                alu_opcode=None,
                input_select=None,
                output_select=None,
                output_enable=0,
                save_core_selection=0,
                comment=None,
                global_command=0
            ),
        ]

        self.outputter.output(instructions, self.output)

        lines = self.output.getvalue().split("\n")

        self.assertEqual(len(lines), 5)  # Last index is blank line
        self.assertEqual(lines[0], '00008')
        self.assertEqual(lines[1], '// This has a comment.')
        self.assertEqual(lines[2], '00008 // This has a comment!')
        self.assertEqual(lines[3], '0ff0c')

    def test_constant_instruction(self):
        """Since the "Constant" instruction is zero for every field, it can
        result in an edge case where it is not generated. This is because of
        confusion between how Python treats None and 0. 0 == None is False,
        however "if 0" and "if None" are equivalent.
        """
        instruction = MlInstruction(
            address=0,
            ram_write=0,
            alu_opcode=0,
            input_select=0,
            output_select=0,
            output_enable=0,
            save_core_selection=0,
            comment=None,
            global_command=4
        )

        self.outputter._output_instruction(instruction, self.output)

        lines = self.output.getvalue().split("\n")

        self.assertEqual(len(lines), 2)  # Last index is blank line
        self.assertEqual(lines[0], '100000')


if __name__ == '__main__':
    unittest.main()
