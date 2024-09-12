#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

ENV_NAME=$1
# ENV_NAME="development"
if [[ "$ENV_NAME" == "" ]]; then
    echo "Error: you must specify environment name"
    echo "Ex: production"
    exit 1
fi

sudo docker run \
    -it --rm \
    -v "$PWD":/data \
    --platform="linux/amd64" \
    mhoger/ember \
    node --max_old_space_size=999999 /usr/local/bin/ember build --environment="$ENV_NAME"

# MH:
#
# https://stackoverflow.com/questions/37509159/ember-js-pass-options-to-node-js
#
# ember build --environment="$ENV_NAME"
# changed to:
# node --max_old_space_size=999999 /usr/local/bin/ember build --environment="$ENV_NAME"

