#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :29.11.16
#notes           :
#==============================================================================


mkdir -p /home/$USER/local

mkdir -p /tmp/compile

cd /tmp/compile

git clone https://github.com/git/git.git

cd vim

./configure --prefix=/home/$USER/local \
    --enable-gui=gnome2 \
    --with-features=huge \
    --enable-cscope \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --with-tlib=ncurses \
    --enable-luainterp

make

make install
