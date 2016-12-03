
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
./configure --prefix=/home/$USER/local --enable-optimizations --enable-shared --with-system-expat --with-system-ffi --enable-unicode=ucs4

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
## pip
####
cd /tmp/compile/
#
wget https://bootstrap.pypa.io/get-pip.py
#
python get-pip.py


