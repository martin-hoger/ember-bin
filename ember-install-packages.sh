#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

sudo docker run -it --rm -v "$PWD":/data mhoger/ember bower install --allow-root 
echo "NPM"
sudo docker run -it --rm -v "$PWD":/data mhoger/ember npm install
