#!/usr/bin/env bash
set -euo pipefail

source dependencies.sh
cwd=$(pwd)

if [ ! -d ~/auxmos ]; then
	git clone https://github.com/${AUXMOS_REPOSITORY} ~/auxmos
	cd ~/auxmos
else
	cd ~/auxmos
	git fetch origin
fi
git fetch --all
git reset --hard
git checkout ${AUXMOS_VERSION}

rustup target add i686-unknown-linux-gnu
export PKG_CONFIG_ALLOW_CROSS=1
cargo build --release --target i686-unknown-linux-gnu
cp target/i686-unknown-linux-gnu/release/libauxmos.so "$cwd/libauxmos.so"
cd "$cwd"
chmod +x libauxmos.so
ldd libauxmos.so
