mkdir -p /home/$USER/local

mkdir -p /tmp/compile

cd /tmp/compile

wget https://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz
#
tar xvzf readline-7.0.tar.gz 
#
cd readline-7.0
#
./configure --prefix=/home/$USER/local
#
make -j 4
#
make install
