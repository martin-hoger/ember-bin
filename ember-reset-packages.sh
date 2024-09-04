#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

read -p "Reset all packages?" KEY

# Do not use sudo for the Apple M1.
SUDO_PREFIX="sudo"
if [[ "$M1" == "1" ]]; then
    SUDO_PREFIX=""
fi

$SUDO_PREFIX docker run -it \
    --platform="linux/amd64" \
    --rm \
    -v "$PWD":/data mhoger/ember \
    sh -c "
    rm -rf node_modules bower_components tmp
    chmod 777 /root -R
    chown node:node /root -R
    bower install --allow-root
    npm install
"
# ./bin/ember-rebuild-node-sass.sh
