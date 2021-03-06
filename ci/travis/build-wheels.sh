#!/bin/bash -xe

# Compile wheels
for PYBIN in /opt/python/*/bin; do
    # "${PYBIN}/pip" install -r /io/dev-requirements.txt
    "${PYBIN}/pip" wheel /io/ -w wheelhouse/
done

# Bundle external shared libraries into the wheels
for whl in wheelhouse/*.whl; do
    auditwheel repair "$whl" -w /io/wheelhouse/
done

# Install packages and test
for PYBIN in /opt/python/*/bin; do
    "${PYBIN}/pip" install ssh2-python --no-index -f /io/wheelhouse
    (cd "$HOME"; "${PYBIN}/python" -c 'from ssh2.session import Session; Session()')
done
