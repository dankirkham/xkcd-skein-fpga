#!/usr/bin/env python
import argparse
import re
import sys

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('report', help='report file to modify')

    args = parser.parse_args()

    pattern = re.compile(' (\d+) assertions\; (\d+) passed\; (\d+) failed\.')

    assertions = 0
    passed = 0
    failed = 0

    print("-------------------- TEST RESULTS --------------------")

    report = open(args.report, 'r')
    for line in report:
        sys.stdout.write(line)
        match = pattern.search(line)

        assertions += int(match.group(1))
        passed += int(match.group(2))
        failed += int(match.group(3))

    report.close()

    report = open(args.report, 'a')
    total_string = 'TOTAL: {} assertions; {} passed; {} failed.\n'.format(assertions, passed, failed)
    report.write(total_string)
    sys.stdout.write(total_string)
    report.close()

    sys.exit(1) if failed > 0 else sys.exit(0)

if __name__ == "__main__":
    main()
