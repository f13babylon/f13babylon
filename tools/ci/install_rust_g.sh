#!/usr/bin/env bash
set -euo pipefail

sudo dpkg --add-architecture i386
sudo apt update
sudo apt install zlib1g-dev:i386 libssl-dev:i386 gcc-multilib g++-multilib libc6-dev-i386 libgit2-dev

source dependencies.sh
cwd=$(pwd)

if [ ! -d ~/rust-g ]; then
	mkdir ~/rust-g
fi

if [ ! -d ~/rust-g/repo ]; then
	git clone https://github.com/tgstation/rust-g ~/rust-g/repo
	cd ~/rust-g/repo
else
	cd ~/rust-g/repo
	git fetch
fi
git reset --hard
git checkout ${RUST_G_VERSION}

# check for rust-g already being compiled with the wanted version
hash_file=~/rust-g/HASH.$RUST_G_VERSION
cache_file=~/rust-g/librust_g.so
if [ -f "$cache_file" ]; then
	echo "Cache file exists"
	if [ -f "$hash_file" ]; then
		echo "Hash file exists"
		hash_wanted=$(cat "$hash_file")
		hash_current=$(sha256sum "$cache_file" | cut -d ' ' -f 1)

		if [ "$hash_wanted" -eq "$hash_current" ]; then
			echo "Using cached rust-g"
			cp "$cache_file" "$cwd/librust_g.so"
			cd "$cwd"
			exit 0

		else
			echo "Hash mismatch: $hash_wanted != $hash_current"
		fi
	else
		echo "Hash file missing."
	fi
fi

rustup target add i686-unknown-linux-gnu
export PKG_CONFIG_ALLOW_CROSS=1
cargo build --release --target i686-unknown-linux-gnu
sha256sum target/i686-unknown-linux-gnu/release/librust_g.so | cut -d ' ' -f 1 > "$hash_file"
cp target/i686-unknown-linux-gnu/release/librust_g.so "$cache_file"
cp target/i686-unknown-linux-gnu/release/librust_g.so "$cwd/librust_g.so"
cd "$cwd"
chmod +x librust_g.so
ldd librust_g.so
