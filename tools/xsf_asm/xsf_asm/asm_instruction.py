class AsmInstruction:
    """Object that holds information about an assembly language instruction.
    Generally, created by a Parser and consumed by a Generator."""

    def __init__(self, operator, operands, comment):
        self.operator = operator
        self.operands = operands
        self.comment = comment
