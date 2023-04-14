#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

# Possible to start the server and pass the API host by env variable:
# sudo API_HOST="https://aaaa.cz" ./bin/ember-server.sh
if [[ "$API_HOST" != "" ]]; then
    echo "API host: $API_HOST"
fi

# Remove running container
docker rm -f "ember" &> /dev/null

docker run \
    -it --rm \
    -v "$PWD":/data \
    -p 4200:4200 \
    -p 49152:49152 \
    -e "API_HOST=$API_HOST" \
    --platform="linux/amd64" \
    --name="ember" \
    mhoger/ember \
    ember server --port 4200 --live-reload-port 49152
