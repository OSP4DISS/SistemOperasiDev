#! /usr/bin/env python3
# Usage: python3 IncludeCode.py < inputFile > outputFile
# Example: python3 IncludeCode.py < 000.pmd > 000.md
#
# Based on: https://fractallambda.com/2011/08/17/pincpy-including-files-and-script-output.html

import os
import re
import sys

include_pattern = re.compile("(\(>)(.*)(<\))")

if __name__ == "__main__":
    output_lines = []

    for line in sys.stdin:
        include_match = re.match(include_pattern, line)
        if include_match:
            filename = include_match.group(2).strip()
            if os.path.isfile(filename):
                with open(filename, "r") as file:
                    output_lines.extend(file.readlines())
            else:
                output_lines.append("")
        else:
            output_lines.append(line)

    sys.stdout.writelines(output_lines)
