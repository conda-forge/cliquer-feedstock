#!/bin/bash

export CFLAGS="-g $CFLAGS"

autoreconf -fi
automake --add-missing --copy
chmod +x configure
./configure --prefix="$PREFIX" --libdir="$PREFIX/lib" --disable-static

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION}" != "1" ]]; then
make check
fi
make install
