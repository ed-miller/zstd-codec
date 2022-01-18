#!/bin/env bash

CPP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z "${ZSTD_DIR}" ]; then
    ZSTD_DIR="${CPP_DIR}/zstd"
fi

echo '------------------------------------------------------------'
cmake -Bbuild-gnumake-debug               -DCMAKE_BUILD_TYPE=Debug
emcmake cmake -Bbuild-emscripten-debug    -DCMAKE_BUILD_TYPE=Debug
cmake -Bbuild-gnumake-release             -DCMAKE_BUILD_TYPE=Release
emcmake cmake -Bbuild-emscripten-release  -DCMAKE_BUILD_TYPE=Release
