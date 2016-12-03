
mkdir -p /tmp/compile

cd /tmp/compile/
#
wget http://www.cpan.org/src/5.0/perl-5.24.0.tar.gz
#
tar xvzf perl-5.24.0.tar.gz
#
cd perl-5.24.0
#
sh Configure -de -Dprefix=/home/$USER/local -Dvendorprefix=/home/$USER/local -Dman1dir=/home/$USER/local/share/man/man1 -Dman3dir=/home/$USER/local/share/man/man3 -Duseshrplib
#
make -j 4
#
make install
#
