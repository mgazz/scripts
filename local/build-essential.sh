#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :29.11.16
#notes           :
#==============================================================================


mkdir -p /home/$USER/local

mkdir -p /tmp/compile

cd /tmp/compile

wget http://security.ubuntu.com/ubuntu/pool/main/b/build-essential/build-essential_12.1ubuntu2.tar.gz

#
tar xvzf build-essential_12.1ubuntu2.tar.gz

cd build-essential-12.2ubuntu2
#
./configure --prefix=/home/$USER/local
#
make

make install 
