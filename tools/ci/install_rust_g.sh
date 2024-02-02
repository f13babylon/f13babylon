#!/usr/bin/env bash
set -euo pipefail

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install zlib1g-dev:i386 libssl-dev:i386 gcc-multilib g++-multilib libc6-dev-i386 libgit2-dev

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

# check for rust-g already being compiled with the wanted version
hash_file=~/rust-g/HASH.$RUST_G_VERSION
if [ -f "target/i686-unknown-linux-gnu/release/librust_g.so" ] && [ -f "$hash_file" ]; then
	hash_wanted=$(cat "$hash_file")
	hash_current=$(sha256sum "target/i686-unknown-linux-gnu/release/librust_g.so" | cut -d ' ' -f 1)
	if [ "$hash_wanted" -eq "$hash_current" ]; then
		echo "Rust-G already compiled and hashes match."
		cp target/i686-unknown-linux-gnu/release/librust_g.so "$cwd/librust_g.so"
		cd "$cwd"
		exit 0
	fi
fi

rustup target add i686-unknown-linux-gnu
export PKG_CONFIG_ALLOW_CROSS=1
cargo build --release --target i686-unknown-linux-gnu
echo $(sha256sum "target/i686-unknown-linux-gnu/release/librust_g.so" | cut -d ' ' -f 1) > "$hash_file"

cp target/i686-unknown-linux-gnu/release/librust_g.so "$cwd/librust_g.so"
cd "$cwd"
chmod +x librust_g.so
ldd librust_g.so
