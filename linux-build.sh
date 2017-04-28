#!/bin/bash

PREMAKE5=utils/premake5
CONFIG=release_x64

if ! [[ "$(uname -m)" == 'x86_64' ]]; then
    echo "Compiling on x86 is not supported"
	exit 1
fi

# Clean old build files
rm -Rf Build/
rm -Rf Bin/

# Generate makefiles
$PREMAKE5 gmake

# Build!
cd Build/
make config=$CONFIG all
