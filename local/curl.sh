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

tar xvzf curl-$VERSION.tar.gz

cd curl-$VERSION

./configure --prefix=/home/$USER/local --with-ssl

make

make install
