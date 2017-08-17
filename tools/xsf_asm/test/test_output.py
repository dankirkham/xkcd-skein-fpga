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
                comment=None
            ),
            MlInstruction(
                address=None,
                ram_write=None,
                alu_opcode=None,
                input_select=None,
                output_select=None,
                output_enable=None,
                save_core_selection=None,
                comment="This has a comment."
            ),
            MlInstruction(
                address=None,
                ram_write=0,
                alu_opcode=0x8,
                input_select=None,
                output_select=None,
                output_enable=0,
                save_core_selection=0,
                comment="This has a comment!"
            ),
            MlInstruction(
                address=0xFF,
                ram_write=0,
                alu_opcode=None,
                input_select=None,
                output_select=None,
                output_enable=0,
                save_core_selection=0,
                comment=None
            ),
        ]

        self.outputter.output(instructions, self.output)

        lines = self.output.getvalue().split("\n")

        self.assertEqual(len(lines), 5)
        self.assertEqual(lines[0], '00008')
        self.assertEqual(lines[1], '// This has a comment.')
        self.assertEqual(lines[2], '00008 // This has a comment!')
        self.assertEqual(lines[3], '0ff0c')

if __name__ == '__main__':
    unittest.main()
