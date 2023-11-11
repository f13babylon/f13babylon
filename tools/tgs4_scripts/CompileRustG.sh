#!/usr/bin/env bash

source "$1/dependencies.sh"

if [ ! -d ./rustg ]; then
	git clone "https://github.com/tgstation/rust-g" ./rustg
	cd rustg
else
	cd rustg
	git fetch origin
fi
git fetch --all
git reset --hard
git checkout ${RUSTG_VERSION}

rustup target add i686-unknown-linux-gnu
export PKG_CONFIG_ALLOW_CROSS=1
cargo build --release --target i686-unknown-linux-gnu
cp target/i686-unknown-linux-gnu/release/librust_g.so "$1/librust_g.so"
chmod +x "$1/librust_g.so"

