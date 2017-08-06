#!/bin/bash -xe

mkdir src
cd src
cmake -DBUILD_SHARED_LIBS=ON -DENABLE_ZLIB_COMPRESSION=ON \
      -DENABLE_CRYPT_NONE=ON -DENABLE_MAC_NONE=ON -DCMAKE_INSTALL_PREFIX=../lib \
      ../libssh2
cmake --build . --target install
