#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :02.12.16
#notes           :
#==============================================================================


mkdir -p /home/$USER/local

mkdir -p /tmp/compile

cd /tmp/compile

git clone https://github.com/hishamhm/htop
#
cd htop/
#
./autogen.sh

make

make install
#
