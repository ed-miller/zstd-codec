#!/bin/env bash

set -e

CPP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ${CPP_DIR} && \
    bash update_projects.sh && \
    cd build-emscripten-release && \
    NODE_OPTIONS="--max-old-space-size=8192" emmake make -j$(nproc) config=release verbose=1
