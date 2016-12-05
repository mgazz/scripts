#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :03.12.16
#notes           :
#==============================================================================

BASE_DIR="$PWD"
PREFIX_DIR="$BASE_DIR/local"

######
###  libssl
######
 
wget https://www.openssl.org/source/openssl-1.0.2j.tar.gz
#
tar xvzf openssl-1.0.2j.tar.gz
#
cd openssl-1.0.2j/
#
export CFLAGS="-fPIC"

./config shared --prefix=$PREFIX_DIR
#./config --prefix=/home/$USER/local
#
make
#
make install

cd $BASE_DIR

######
### python
######

wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tar.xz
#
tar xvfJ Python-2.7.12.tar.xz
#
cd Python-2.7.12/
#
./configure --prefix=$PREFIX_DIR --enable-optimizations --enable-shared --with-system-expat --with-system-ffi --enable-unicode=ucs4

echo "
SSL=$PREFIX_DIR/ssl
_ssl _ssl.c \
	                -DUSE_SSL -I$(SSL)/include -I$(SSL)/include/openssl \
			                            -L$(SSL)/lib -lssl -lcrypto
" >> Modules/Setup.dist
#
make -j 4
#
make install
#

cd $BASE_DIR

wget https://bootstrap.pypa.io/get-pip.py

python get-pip.py --prefix=$PREFIX_DIR

cd $BASE_DIR

#####
## ffi
#####
wget ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz
#
tar xvzf libffi-3.2.1.tar.gz
#
cd libffi-3.2.1
#
sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/'     -i include/Makefile.in && sed -e '/^includedir/ s/=.*$/=@includedir@/'     -e 's/^Cflags: -I${includedir}/Cflags:/'     -i libffi.pc.in
./configure --prefix=$PREFIX_DIR
#
make -j 4
#
make install
#
#

cd $BASE_DIR

git clone https://github.com/ansible/ansible.git

export PYTHONPATH=$PREFIX_DIR/lib

chmod +x ./ansible/env-setup

./ansible/env-setup
#

######
### asciidoc
######

wget http://sourceforge.net/projects/asciidoc/files/asciidoc/8.6.9/asciidoc-8.6.9.tar.gz
#
tar xvzf asciidoc-8.6.9.tar.gz
#
cd asciidoc-8.6.9/
#
./configure --prefix=$PREFIX_DIR --sysconfdir=$PREFIX_DIR/etc
#
make
#
make install
#

cd $BASE_DIR

######
### ansible to finish
######

#export LD_LIBRARY_PATH="/home/$USER/local/lib64:/home/$USER/local/lib"

# gloabal option for centos
/home/$USER/.local/bin/pip install --global-option=build_ext --global-option="-I$PREFIX_DIR/lib/libffi-3.2.1/include" --install-option="--prefix=$PREFIX_DIR" ansible

chmod -R +w asciidoc-8.6.9* get-pip.py libffi-3.2.1* openssl-1.0.2j* Python-2.7.12*
#
rm -r asciidoc-8.6.9* get-pip.py libffi-3.2.1* openssl-1.0.2j* Python-2.7.12*
#
