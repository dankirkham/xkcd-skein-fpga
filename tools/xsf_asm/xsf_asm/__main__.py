import argparse
import logging
import re
from xsf_asm import generate, parse, output

def main():
    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument("input_file", help="file to be assembled")
    argument_parser.add_argument("-i", help="generates core input file to be used with the core simulator", action="store_true")
    argument_parser.add_argument("-o", help="output file path/name", metavar="output_file")
    args = argument_parser.parse_args()

    logging.basicConfig(level=logging.DEBUG)

    parser = parse.Parser()
    with open(args.input_file, "r") as f:
        asm_instructions = parser.parse(f)

    generator = generate.Generator()
    ml_instructions = generator.generate(asm_instructions)

    outputter = output.Outputter()

    if args.o:
        output_filename = args.o
    else:
        m = re.search("^(.*)\.asm", args.input_file)

        if m:
            output_filename = m.group(1) + '.ml'
        else:
            output_filename = args.input_file + '.ml'

    f = open(output_filename, "w")

    outputter.output(ml_instructions, f)

if __name__ == "__main__":
    main()
