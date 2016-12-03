#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :03.12.16
#notes           :
#==============================================================================


####
## python 3
####
wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0b4.tar.xz
#
tar xvfJ Python-3.6.0b4.tar.xz
#
./configure --prefix=/home/$USER/local --enable-optimizations
#provide ssl support --> source: http://stackoverflow.com/questions/5937337/building-python-with-ssl-support-in-non-standard-location
echo "
SSL=/home/$USER/local/ssl
_ssl _ssl.c \
        -DUSE_SSL -I$(SSL)/include -I$(SSL)/include/openssl \
            -L$(SSL)/lib -lssl -lcrypto
" >> Modules/Setup.dist
#
make -j 4
#
make install
#

###
## python 2
####
cd /tmp/compile/
#
wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tar.xz
#
tar xvfJ Python-2.7.12.tar.xz
#
cd Python-2.7.12/
#
./configure --prefix=/home/$USER/local --enable-optimizations

echo "
SSL=/home/$USER/local/ssl
_ssl _ssl.c \
        -DUSE_SSL -I$(SSL)/include -I$(SSL)/include/openssl \
            -L$(SSL)/lib -lssl -lcrypto
" >> Modules/Setup.dist
#
make -j 4
#
make install
#
