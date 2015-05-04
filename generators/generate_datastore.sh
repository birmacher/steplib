#!/bin/bash

set -v
set -e

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${THIS_SCRIPT_DIR}"

bundle update

# --- STEP COLLECTION CONFIGS
export STEP_ASSETS_URL_ROOT='https://steplib-assets.s3.amazonaws.com'
export STEPLIB_SOURCE='https://github.com/steplib/steplib'

# --- Generate
mkdir -p ../tmp
bundle exec ruby datastore_json.rb --pretty -o ../tmp/steplib_datastore.json
