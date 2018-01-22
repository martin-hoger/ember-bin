#!/usr/bin/env bash

# chromium --no-sandbox
mv /usr/bin/chromium /usr/bin/chromium-renamed
touch /usr/bin/chromium
chmod 777 /usr/bin/chromium
echo "/usr/bin/chromium-renamed --no-sandbox --user-data-dir \$@" > /usr/bin/chromium

Xvfb :1 -screen 0 1024x768x16 &
export DISPLAY=:1.0
ember test --server --query "&nojshint"

