#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :28.11.16
#notes           :
#==============================================================================

VERSION="7.51.0"

mkdir -p /home/$USER/local

mkdir -p /tmp/compile

cd /tmp/compile

wget https://curl.haxx.se/download/curl-$VERSION.tar.gz

cd curl-$VERSION/

tar xvzf curl-$version.tar.gz

cd curl-$version

./configure --prefix=/home/$USER/local --with-ssl

make

make install
