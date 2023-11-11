source_url='https://github.com/libgit2/libgit2/archive/refs/tags/v0.28.4.zip'

apt update
apt install -y cmake unzip libssl-dev

mkdir ~/libgit2
cd ~/libgit2

if [ -f libgit2.zip ]; then
	rm libgit2.zip
fi
wget -O libgit2.zip "$source_url"

if [ -d libgit2-* ]; then
	rm -rf libgit2-*
fi
unzip libgit2.zip

cd libgit2-*
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local ..
make
make install
