#!/bin/bash

./InstallDeps.sh

set -e
set -x

# update rust-g
bash ./CompileRustG.sh "$1"
bash ./CompileAuxmos.sh "$1"

# compile tgui
echo "Compiling tgui..."
cd "$1"
env TG_BOOTSTRAP_CACHE="$original_dir" TG_BOOTSTRAP_NODE_LINUX=1 CBT_BUILD_MODE="TGS" tools/bootstrap/node tools/build/build.js
