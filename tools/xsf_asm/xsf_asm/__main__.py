import argparse
import logging
import parse

def main():
    argument_parser = argparse.ArgumentParser()
    argument_parser.add_argument("input_file", help="file to be assembled")
    argument_parser.add_argument("-i", help="generates core input file to be used with the core simulator", action="store_true")
    argument_parser.add_argument("-o", help="output file path/name", metavar="output_file")
    args = argument_parser.parse_args()

    logging.basicConfig(level=logging.DEBUG)

    f = open(args.input_file, "r")
    parse.parse(f)


if __name__ == "__main__":
    main()
