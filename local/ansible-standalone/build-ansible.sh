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
 
./get-sources.sh
#
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
#
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


python get-pip.py --prefix=$PREFIX_DIR

cd $BASE_DIR

#####
## ffi
#####
#
#
cd libffi-3.2.1
#
sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/'     -i include/Makefile.in 
sed -e '/^includedir/ s/=.*$/=@includedir@/'     -e 's/^Cflags: -I${includedir}/Cflags:/'     -i libffi.pc.in
./configure --prefix=$PREFIX_DIR --disable-static
#
make -j 4
#
make install
#
#

cd $BASE_DIR
#

######
### asciidoc
######
#
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


export PYTHONPATH=$PREFIX_DIR/lib

chmod +x ./ansible/hacking/env-setup

./ansible/hacking/env-setup

######
### ansible to finish
######

export LD_LIBRARY_PATH="$PREFIX_DIR/lib64:$PREFIX_DIR/lib"

export PKG_CONFIG_PATH=$PREFIX_DIR/lib/pkgconfig

# gloabal option for centos
/home/$USER/.local/bin/pip install --global-option=build_ext --global-option="-I$PREFIX_DIR/include" --install-option="--prefix=$PREFIX_DIR" ansible

