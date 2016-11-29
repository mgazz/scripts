#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :28.11.16
#notes           :tt
#==============================================================================

#need  curl
./curl.sh

mkdir -p /tmp/compile

cd /tmp/compile

wget https://stat.ethz.ch/R/daily/R-patched.tar.gz

tar xvzf R-patched.tar.gz 

cd R-patched

./tools/rsync-recommended

#export CPPFLAGS='-I/home/'"$USER"'/local/include'

#export LDFLAGS='-L/home/'"$USER"'/local/lib/'

LD_LIBRARY_PATH=/home/$USER/local ./configure --prefix=/home/$USER/local --with-x=no
#https problem resolved adding ~/local to PATH
make 
make install

