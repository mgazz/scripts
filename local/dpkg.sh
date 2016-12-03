
#####
### dpkg and apt
#####

#source: http://www.linuxfromscratch.org/hints/downloads/files/OLD/apt.txt

mkdir -p /tmp/compile

cd /tmp/compile
#
wget http://ftp.acc.umu.se/mirror/cdimage/snapshot/Debian/pool/main/d/dpkg/dpkg_1.18.15.tar.xz
#
tar xvfJ dpkg_1.18.15.tar.xz
#
cd dpkg-1.18.15/
#
./configure --prefix=/home/$USER/local --with-admindir=/home/$USER/local/var/lib/dpkg
#
make
#
make install
#


