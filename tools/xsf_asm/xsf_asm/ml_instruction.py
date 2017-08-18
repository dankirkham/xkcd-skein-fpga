class MlInstruction:
    """Object that holds information about a machine language instruction.
    Generally, created by a Generator and consumed by a Formatter."""

    def __init__(self, address, ram_write, alu_opcode, input_select,
                 output_select, output_enable, save_core_selection, comment):
        self.address = address
        self.ram_write = ram_write
        self.alu_opcode = alu_opcode
        self.input_select = input_select
        self.output_select = output_select
        self.output_enable = output_enable
        self.save_core_selection = save_core_selection
        self.comment = comment

    def has_instruction(self):
        """Determines if a MlInstruction object is an actual instruction, or if
        it is just a comment.
        """

        return not (
            not self.address and
            not self.ram_write and
            not self.alu_opcode and
            not self.input_select and
            not self.output_select and
            not self.output_enable and
            not self.save_core_selection
        )

    def has_comment(self):
        """Determines if a MlInstruction object has a comment supplied with it.
        """

        return self.comment is not None and self.comment != ''
