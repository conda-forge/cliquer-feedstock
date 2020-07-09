#!/bin/bash

export CFLAGS="-g $CFLAGS"

autoreconf -fi
automake --add-missing --copy
chmod +x configure
./configure --prefix="$PREFIX" --libdir="$PREFIX/lib" --disable-static

make -j${CPU_COUNT}
make check
make install
