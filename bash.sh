#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

# Remove running container
docker rm -f "ember" &> /dev/null

docker run \
    -it --rm \
    -v "$PWD":/data \
    -p 4200:4200 \
    -p 49152:49152 \
    --name="ember" \
    mhoger/ember \
    bash
