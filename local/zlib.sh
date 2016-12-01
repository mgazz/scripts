#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :28.11.16
#notes           :
#==============================================================================


mkdir -p /home/$USER/local

mkdir -p /tmp/compile

cd /tmp/compile

wget http://www.zlib.net/zlib-1.2.8.tar.gz
#
tar xvzf zlib-1.2.8.tar.gz
#
cd zlib-1.2.8
#
./configure --prefix=/home/$USER/local

make
#
make install

