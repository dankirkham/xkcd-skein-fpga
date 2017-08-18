import unittest
from xsf_asm.parse import Parser, ParserError


class TestParser(unittest.TestCase):
    def setUp(self):
        self.parser = Parser()

    def test_comments(self):
        lines = ["Add // This is a comment!"]

        asm_instructions = self.parser.parse(lines)

        self.assertEqual("This is a comment!", asm_instructions[0].comment)

    def test_comment_without_instruction(self):
        lines = ["// This is a comment on it's own line!"]

        asm_instructions = self.parser.parse(lines)

        self.assertEqual("This is a comment on it's own line!",
                         asm_instructions[0].comment)

    def test_invalid_integer(self):
        lines = ["SaveNonce 1q"]

        self.assertRaises(ParserError, self.parser.parse, lines)

    def test_invalid_operator(self):
        lines = ["Addz"]

        self.assertRaises(ParserError, self.parser.parse, lines)

    def test_invalid_choice(self):
        lines = ["Load 1 Promary"]

        self.assertRaises(ParserError, self.parser.parse, lines)

    def test_unexpected_operand(self):
        lines = ["Add 1"]

        self.assertRaises(ParserError, self.parser.parse, lines)

    def test_parse(self):
        lines = [
            "Add",
            "SaveNonce 1",
            "Load 1 Primary"
        ]

        asm_instructions = self.parser.parse(lines)

        self.assertEqual("Add", asm_instructions[0].operator)

        self.assertEqual("SaveNonce", asm_instructions[1].operator)
        self.assertIsNotNone(asm_instructions[1].operands)
        self.assertEqual("1", asm_instructions[1].operands[0])

        self.assertEqual("Load", asm_instructions[2].operator)
        self.assertIsNotNone(asm_instructions[2].operands)
        self.assertEqual("1", asm_instructions[2].operands[0])
        self.assertEqual("Primary", asm_instructions[2].operands[1])


if __name__ == '__main__':
    unittest.main()
