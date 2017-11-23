#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

docker run -it --rm -v "$PWD":/data mhoger/ember bower install --allow-root 
docker run -it --rm -v "$PWD":/data mhoger/ember npm install
