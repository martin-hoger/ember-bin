#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

ENV_NAME=$1
if [[ "$ENV_NAME" == "" ]]; then
    echo "Error: you must specify environment name"
    echo "Ex: production"
    exit 1
fi

docker run \
    -it --rm \
    -v "$PWD":/data \
    mhoger/ember \
    ember build --environment="$ENV_NAME"
