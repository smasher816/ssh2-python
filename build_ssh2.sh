#!/bin/bash -xe

rm -rf src && mkdir src && cd src
cmake -DBUILD_SHARED_LIBS=ON -DENABLE_ZLIB_COMPRESSION=ON \
      -DENABLE_CRYPT_NONE=ON -DENABLE_MAC_NONE=ON -DCMAKE_INSTALL_PREFIX=../lib \
      ../libssh2
cmake --build .
rm -rf ssh2/_libssh2 && mkdir -p ssh2/_libssh2
cp -a src/src/*.so* ssh2/_libssh2/
