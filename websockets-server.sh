#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

IMAGE_NAME="registry.gitlab.com/fetview/websockets-server:latest"
CONTAINER_NAME="yt-websockets-server"
SERVER="172.17.0.1"
PORT=3000

# Check the iptables item.
sudo iptables -L -v -n | grep -P "ACCEPT.*dpt:$PORT$" > /dev/null
# If not present.
if [[ "$?" != "0" ]]; then
    sudo iptables -I INPUT -p tcp -d 172.17.0.1 --dport $PORT -j ACCEPT
    echo "Firewall is open for $PORT"
fi

sudo docker rm -f "$CONTAINER_NAME" &> /dev/null

echo "Running at http://$SERVER:$PORT"

# In production run:
# -e NODE_ENV='production' \

sudo docker run \
    -it \
    --rm \
    --name "$CONTAINER_NAME" \
    -e NODE_ENV='development' \
    -e HTPASSWD='websockets:WeDsrziZb3Iac3' \
    -e DEBUG=1 \
    -e PORT=$PORT \
    -p $SERVER:$PORT:3000 \
    "$IMAGE_NAME"

