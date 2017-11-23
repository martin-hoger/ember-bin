#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

# xhost +

# docker run \
#     -it --rm \
#     -v "$PWD":/data \
#     -e DISPLAY=$DISPLAY \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     --net="host" \
#     --name="ember" \
#     --privileged=true \
#     mhoger/ember \
#     ember test --server

docker run -it --rm -v "$PWD":/data mhoger/ember rm -rf tmp

docker run \
    -it --rm \
    -v "$PWD":/data \
    --net="host" \
    --name="ember-server-test" \
    --privileged=true \
    mhoger/ember \
    /data/bin/ember-server-test/start.sh

