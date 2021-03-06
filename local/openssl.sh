#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :29.11.16
#notes           :
#==============================================================================


mkdir -p /home/$USER/local

mkdir -p /tmp/compile

cd /tmp/compile

wget https://www.openssl.org/source/openssl-1.0.2j.tar.gz
#
tar xvzf openssl-1.0.2j.tar.gz
#
cd openssl-1.0.2j/
#
export CFLAGS="-fPIC"

./config shared --prefix=/home/$USER/local
#./config --prefix=/home/$USER/local
#
make
#
make install

