#!/usr/bin/env bash

source "$1/dependencies.sh"

if [ ! -d ./auxmos ]; then
	git clone https://github.com/${AUXMOS_REPOSITORY} ./auxmos
	cd auxmos
else
	cd auxmos
	git fetch origin
fi
git fetch --all
git reset --hard
git checkout ${AUXMOS_VERSION}

rustup target add i686-unknown-linux-gnu
export PKG_CONFIG_ALLOW_CROSS=1
cargo build --release --target i686-unknown-linux-gnu
cp target/i686-unknown-linux-gnu/release/libauxmos.so "$1/libauxmos.so"
chmod +x "$1/libauxmos.so"

