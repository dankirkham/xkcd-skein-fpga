from typing import List
from xsf_asm.ml_instruction import MlInstruction


class Outputter:
    def __init__(self, output_format='full'):
        self.output_format = output_format

    def _output_instruction(self, ml: MlInstruction, out_file, format="default"):
        """Writes a Machine Language instruction to a file as ASCII-encoded hex

        Atrributes:
            ml -- a Machine Language Instruction
            out_file -- an output file
            format -- output style, use 'core_sim' for Core Simulator compatability
        """

        if ml.has_instruction():
            # Default values
            address = ml.address if ml.address is not None else 0
            ram_write = ml.ram_write if ml.ram_write is not None else 0
            alu_opcode = ml.alu_opcode if ml.alu_opcode is not None else 0xC
            input_select = (
                ml.input_select if ml.input_select is not None else 0
            )
            output_select = (
                ml.output_select if ml.output_select is not None else 0
            )
            output_enable = (
                ml.output_enable if ml.output_enable is not None else 0
            )
            save_core_selection = (
                ml.save_core_selection if (
                    ml.save_core_selection is not None
                ) else 0
            )
            global_command = (
                ml.global_command if (
                    ml.global_command is not None
                ) else 0
            )

            binary = (
                (save_core_selection << 17) |
                (ram_write << 16) |
                (address << 8) |
                (input_select << 6) |
                (output_select << 5) |
                (output_enable << 4) |
                (alu_opcode << 0)
            )

            if self.output_format == 'full':
                binary |= (global_command << 18)

            out_file.write("{0:0{1}x}".format(binary, 5))

        # Place space between instruction an comment
        if ml.has_instruction() and ml.has_comment():
            out_file.write(" ")

        if ml.has_comment():
            out_file.write("// {}".format(ml.comment))

        if ml.has_comment() or ml.has_instruction():
            out_file.write("\n")

    def output(self, instructions: List[MlInstruction], f):
        for ml in instructions:
            self._output_instruction(ml, f)
