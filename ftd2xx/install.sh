#!/bin/bash
# Rudimentary install script
# These choice files are extracted from the DMG in the package found at:
# https://ftdichip.com/software-examples/mpsse-projects/libmpsse-i2c-examples/
# And more specifically:
# https://ftdichip.com/wp-content/uploads/2020/08/libMPSSE_Source.zip

set -x -e

cp bin/libftd2xx.1.4.24.dylib /usr/local/lib/libftd2xx.1.4.24.dylib
ln -s /usr/local/lib/libftd2xx.1.4.24.dylib /usr/local/lib/libftd2xx.dylib
cp bin/ftd2xx.h /usr/local/include
cp bin/WinTypes.h /usr/local/include
