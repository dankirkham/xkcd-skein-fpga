#!/usr/bin/env python
import argparse
import re

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('report', help='report file to modify')

    args = parser.parse_args()

    pattern = re.compile(' (\d+) assertions\; (\d+) passed\; (\d+) failed\.')

    assertions = 0
    passed = 0
    failed = 0

    report = open(args.report, 'r')
    for line in report:
        match = pattern.search(line)

        assertions += int(match.group(1))
        passed += int(match.group(2))
        failed += int(match.group(3))

    report.close()

    report = open(args.report, 'a')
    report.write('TOTAL: {} assertions; {} passed; {} failed.\n'.format(assertions, passed, failed))
    report.close()


if __name__ == "__main__":
    main()
