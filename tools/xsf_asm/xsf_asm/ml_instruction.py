class MlInstruction:
    """Object that holds information about a machine language instruction.
    Generally, created by a Generator and consumed by a Formatter."""

    def __init__(self, address, ram_write, alu_opcode, input_select, output_select, output_enable, save_core_selection, comment):
        self.address = address
        self.ram_write = ram_write
        self.alu_opcode = alu_opcode
        self.input_select = input_select
        self.output_select = output_select
        self.output_enable = output_enable
        self.save_core_selection = save_core_selection
        self.comment = comment
