from typing import List
from xsf_asm.ml_instruction import MlInstruction

class Outputter:
    def __init__(self):
        pass

    def _output_instruction(self, ml: MlInstruction, out_file):
        """Writes a Machine Language instruction to a file as ASCII-encoded hex

        Atrributes:
            ml -- a Machine Language Instruction
            out_file -- an output file
        """

        if ml.has_instruction():
            # Default values
            address = ml.address if ml.address else 0
            ram_write = ml.ram_write if ml.ram_write else 0
            alu_opcode = ml.alu_opcode if ml.alu_opcode else 0xC
            input_select = ml.input_select if ml.input_select else 0
            output_select = ml.output_select if ml.output_select else 0
            output_enable = ml.output_enable if ml.output_enable else 0
            save_core_selection = ml.save_core_selection if ml.save_core_selection else 0

            binary = (
                (address << 10) |
                (ram_write << 9) |
                (alu_opcode << 5) |
                (input_select << 3) |
                (output_select << 2) |
                (output_enable << 1) |
                (save_core_selection << 0)
            )

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
