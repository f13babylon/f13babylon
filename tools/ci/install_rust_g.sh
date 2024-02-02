#!/usr/bin/env bash
set -euo pipefail

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install zlib1g-dev:i386 libssl-dev:i386 libgcc1:i386

source dependencies.sh
cwd=$(pwd)

if [ ! -d ~/rust-g ]; then
	git clone https://github.com/tgstation/rust-g ~/rust-g
	cd ~/rust-g
else
	cd ~/rust-g
	git fetch
fi
git reset --hard
git checkout ${RUST_G_VERSION}

rustup target add i686-unknown-linux-gnu
export PKG_CONFIG_ALLOW_CROSS=1
cargo build --release --target i686-unknown-linux-gnu
cp target/i686-unknown-linux-gnu/release/librust_g.so "$cwd/librust_g.so"
cd "$cwd"
chmod +x librust_g.so
ldd librust_g.so
