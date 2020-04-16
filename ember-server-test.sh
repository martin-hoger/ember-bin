#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

# Delete cache
sudo docker run -it --rm -v "$PWD":/data mhoger/ember rm -rf tmp

# Generate params
DOCKER_PARAMS=(
    -it --rm 
    -v "$PWD":/data 
    --net="host" 
    --name="ember-server-test" 
    --privileged=true
)

# Add tests from the submodules.
while read LOCAL_PATH    
do
  DOCKER_PARAMS+=( -v "$SCRIPT_DIR/../$LOCAL_PATH:/data/tests/$LOCAL_PATH" )
done <<<$(ls -d1 lib/*/tests/*)

# echo; echo; echo "${DOCKER_PARAMS[@]}";
# exit;


sudo docker run "${DOCKER_PARAMS[@]}" mhoger/ember ember test --server --query=nolint
# Possible to filter a test
# --filter "c-form-field-select-simple-html"

#--------------------------

# # Content of /data/bin/ember-server-test/start.sh
# 
# mv /usr/bin/chromium /usr/bin/chromium-renamed
# touch /usr/bin/chromium
# chmod 777 /usr/bin/chromium
# echo "/usr/bin/chromium-renamed --no-sandbox --user-data-dir \$@" > /usr/bin/chromium
# 
# Xvfb :1 -screen 0 1024x768x16 &
# export DISPLAY=:1.0
# ember test --server --query "&nojshint"

