#!/bin/bash
set -euo pipefail
source dependencies.sh

source_url="https://github.com/libgit2/libgit2"
libgit_tag="v0.28.5"
cwd=$(pwd)

if [ ! -d ~/libgit2 ]; then
	mkdir ~/libgit2
fi

cache_file=~/libgit2/libgit2.so
hash_file=~/libgit2/HASH.$libgit_tag

if [ -f "$cache_file" ]; then
	echo "Cache file exists"
	if [ -f "$hash_file" ]; then
		echo "Hash file exists"
		hash_wanted=$(cat "$hash_file")
		hash_current=$(sha256sum "$cache_file" | cut -d ' ' -f 1)

		if [ "$hash_wanted" = "$hash_current" ]; then
			echo "Using cached libgit2"
			sudo cp "$cache_file" /usr/local/include/libgit2.so
			sudo chown root:root /usr/local/include/libgit2.so
			sudo chmod 755 /usr/local/include/libgit2.so
			cd $cwd
			exit 0

		else
			echo "Hash mismatch: $hash_wanted != $hash_current"
		fi
	else
		echo "Hash file missing."
	fi
fi

if [ ! -d ~/libgit2/repo ]; then
	git clone $source_url ~/libgit2/repo
	cd ~/libgit2/repo
else
	cd ~/libgit2/repo
	git fetch
fi

git reset --hard
git checkout v0.28.5

sudo apt install build-essential cmake -y
mkdir -p ~/libgit2/build
cd ~/libgit2/build
cmake ../repo
cmake --build .

sha256sum libgit2.so | cut -d ' ' -f 1 > "$hash_file"
cp -f libgit2.so "$cache_file"
sudo cp -f libgit2.so /usr/local/include/libgit2.so
sudo chown root:root /usr/local/include/libgit2.so
sudo chmod 755 /usr/local/include/libgit2.so
cd $cwd
