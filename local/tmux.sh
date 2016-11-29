#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :29.11.16
#notes           :
#==============================================================================


#####
### libvert
####
mkdir -p /home/$USER/local

mkdir -p /tmp/compile

cd /tmp/compile

wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
#
tar xvzf libevent-2.0.22-stable.tar.gz 
#
cd libevent-2.0.22-stable/
#
./configure --prefix=/home/$USER/local
#
make
#
make install
#
#####
## tmux
###
cd ../

## install libvert before tmux
git clone https://github.com/tmux/tmux
#
cd tmux/
#
sh autogen.sh 
#
./configure --prefix=/home/$USER/local
# check make install
make
#
make install
