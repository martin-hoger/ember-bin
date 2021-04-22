#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

read -p "Reset all packages?" KEY

sudo docker run -it --rm -v "$PWD":/data mhoger/ember sh -c "
    rm -rf node_modules bower_components tmp
    chmod 777 /root -R
    chown node:node /root -R
    bower install --allow-root 
    yarn install
"
    # npm install
# ./bin/ember-rebuild-node-sass.sh
