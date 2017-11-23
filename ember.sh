#!/usr/bin/env bash

USER=$(logname)

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

docker run \
    -it --rm \
    -v "$PWD":/data \
    mhoger/ember \
    ember $@

chown $USER:$USER app -R
chown $USER:$USER .*
chown $USER:$USER *
