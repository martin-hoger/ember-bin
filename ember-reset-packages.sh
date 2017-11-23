#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

read -p "Reset all packages?" KEY

docker run -it --rm -v "$PWD":/data mhoger/ember rm -rf node_modules bower_components tmp
docker run -it --rm -v "$PWD":/data mhoger/ember npm install
docker run -it --rm -v "$PWD":/data mhoger/ember bower install --allow-root 
./bin/rebuild-node-sass.sh
