#!/bin/bash
set -euo pipefail
source dependencies.sh

source_url="https://github.com/libgit2/libgit2"
libgit_tag="v0.28.5"
cwd=$(pwd)

if [ ! -d ~/libgit2 ]; then
	mkdir ~/libgit2
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
cmake -DCMAKE_INSTALL_PREFIX=/usr/local ../repo
make
sudo make install
