from xsf_asm.asm_instruction import AsmInstruction
import logging
import os
import re
import yaml


class ParserError(Exception):
    """Exception raised for parsing errors

    Attributes:
        expression -- input expression in which the error occurred
        message -- explanation of the error
    """

    def __init__(self, expression, message):
        self.expression = expression
        self.message = message


class Parser:
    """Reads assembly language file, ensures all instructions are of valid
    syntax, and creates AsmInstruction objects that can be used by
    code generators."""

    def __init__(self):
        with open(os.path.abspath(os.path.join(os.path.dirname(__file__),
                                               "data/instructions.yml"))) as f:
            self.instruction_schema = yaml.load(f)

    def _is_int(self, string):
        try:
            int(string)
            return True
        except ValueError:
            return False

    def _is_type_valid(self, value, expected_type):
        """Checks whether or not a value is of the expected type. Returns True
        if value is of the expected type

        Attributes:
            value -- string, the value to test
            expected_type -- the data type that the value is expected to be
        """

        if expected_type["type"] == "int":
            if not self._is_int(value):
                raise ParserError(value, "Operand expected to be of type int")
        elif expected_type["type"] == "choice":
            if value not in expected_type["values"]:
                raise ParserError(
                    value,
                    (
                        "Operand expected to be one of the following values: "
                        "{}".format(expected_type["values"])
                    )
                )
        else:
            raise RuntimeError(
                "{} is not defined in instruction_schema".format(
                    expected_type["type"]
                )
            )

    def _parse_operands(self, operator, operands):
        """Parses operands and ensures that they are valid.

        Attributes:
            operator -- string with operator
            operands -- list of strings with operands
        """
        expected_operands = self.instruction_schema[operator]

        if expected_operands == "no_operands":
            if len(operands) > 0:
                raise ParserError(operands[0], "Unexpected operand")
        else:
            for i in range(len(operands)):
                self._is_type_valid(operands[i], expected_operands[i])

    def _seperate_comment(self, line):
        """Takes a line and retuns a tuple with an instruction and a comment
        string.

        Attributes:
            instruction -- string with one instruction and an optional comment
        """

        # Separate instruction from comment
        m = re.search("^([^\/]*)\/*(.*)", line)

        # Strip leading and trailing whitespace and save instruction and
        # comments
        instruction = m.group(1).strip()
        comment = m.group(2).strip()

        return instruction, comment

    def _parse_line(self, line):
        """Parse a line that may contain a comment and return an
        AsmInstruction object

        Attributes:
            line -- string with one instruction and an optional comment
        """

        line = line.strip()

        logging.debug("Parsing line: {}".format(line))

        instruction, comment = self._seperate_comment(line)

        logging.debug("Instruction: {}; Comment: {}".format(instruction,
                                                            comment))

        words = instruction.split(" ")

        if len(words) != 0 and words[0] != '':
            operator = words[0]  # Pull the operator from this list
            operands = words[1:]

            logging.debug("Operator: {}; Operands: {}".format(operator,
                                                              operands))

            if operator not in self.instruction_schema:
                raise ParserError(operator, "Invalid instruction")

            self._parse_operands(operator, operands)
        else:
            operator = None
            operands = None

        return AsmInstruction(operator, operands, comment)

    def parse(self, lines):
        """Parse an assembly language program and return a list of
        AsmInstruction objects.

        Attributes:
            lines -- list of instruction strings
        """

        instructions = []

        for line in lines:
            asm_instruction = self._parse_line(line)

            instructions.append(asm_instruction)

        return instructions
