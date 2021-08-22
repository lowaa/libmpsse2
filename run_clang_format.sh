#!/bin/bash

set -e -x

# Uses .clang-format to format our project files!
find LibMPSSE -name "*.h" -exec clang-format -style=file -i {} \;
find LibMPSSE -name "*.c" -exec clang-format -style=file -i {} \;
