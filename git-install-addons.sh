#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

read -p "This script will install multiple submodules, continue? [n] " CONTINUE
if [[ "$CONTINUE" != "y" ]]; then
    echo "skipping..."
    exit
fi

mkdir -p lib

git submodule add https://github.com/martin-hoger/ember-c-base-pack lib/ember-c-base-pack
git submodule add https://github.com/martin-hoger/ember-c-form lib/ember-c-form
git submodule add https://github.com/martin-hoger/ember-c-datepicker-from-to lib/ember-c-datepicker-from-to

echo
echo "Add to package.json, under devDependencies:"
echo '
  "ember-addon": {
    "paths": [
      "lib/ember-c-datepicker-from-to",
      "lib/ember-c-base-pack",
      "lib/ember-c-form"
    ]
  }
'

