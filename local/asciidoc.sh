#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :03.12.16
#notes           :
#==============================================================================

#####
### asciidoc for ansible
#####

mkdir -p /tmp/compile

cd /tmp/compile

wget http://sourceforge.net/projects/asciidoc/files/asciidoc/8.6.9/asciidoc-8.6.9.tar.gz
#
#
tar xvzf asciidoc-8.6.9.tar.gz 
#
cd asciidoc-8.6.9/
#
./configure --prefix=/home/$USER/local --sysconfdir=/home/$USER/local/etc
#
make
#
make install
#
