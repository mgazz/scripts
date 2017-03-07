sudo yum install ruby
#
git clone https://github.com/mgazz/scripts
#
cd scripts/
#
cd sys-setup/
#
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
#
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
#
sudo yum install -y openssl-devel readline-devel zlib-devel
#
./.rbenv/bin/rbenv install 2.3.3
#
./.rbenv/bin/rbenv global 2.3.3
#
sudo gem update --system
#
cd /tmp/
#
wget https://releases.hashicorp.com/vagrant/1.9.2/vagrant_1.9.2_x86_64.rpm?_ga=1.62663913.490764421.1488642864
#
mv vagrant_1.9.2_x86_64.rpm\?_ga\=1.62663913.490764421.1488642864 vagrant_1.9.2_x86_64.rpm
#
sudo rpm -Uvh vagrant_1.9.2_x86_64.rpm 
#
# https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-centos-7
sudo yum install epel-release
#
sudo yum install -y ansible
# trash-cli
git clone https://github.com/andreafrancia/trash-cli.git
#
cd trash-cli/
#
python setup.py install --user
#
VERSION=2016.3.4
#
wget http://download.jetbrains.com/idea/ideaIC-$VERSION.tar.gz
#
tar xvzf ideaIC-2016.3.4.tar.gz
#
cd idea-IC-163.12024.16/
#
mkdir -p ~/sw
#
mv idea-IC-163.12024.16 ~/sw/
#
git clone https://github.com/y3sh/Intellij-Colors-Sublime-Monokai.git
# Intellij -> File -> Import Settings -> Select Jar
# Select Sublime Monokai as the theme in Settings -> Editor -> Colors & Fonts



#######
#######
#######

mkdir -p /home/$USER/local
#
git clone https://github.com/vim/vim.git /tmp/vim
#
cd /tmp/vim/
#
sudo yum install tree -y
#
sudo yum install htop cmake libncurses-dev -y
#
# no ncurses and htop libncurses no package
sudo yum install gcc -y
sudo yum install python-devel
sudo yum install gcc-c++
sudo yum install ncurses-devel
#
./configure --prefix=/home/$USER/local \
    --enable-gui=gnome2 \
    --with-features=huge \
    --enable-cscope \
    --enable-multibyte \
    --enable-luainterp \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --with-python-config-dir=/lib64 \
    --with-tlib=ncurses
#
sudo yum search libxt
#
sudo yum install libXt-devel
#
make
#
make install
#

mkdir -p ~/.vim/bundle

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sed -i 's/colorscheme/"colorscheme/' ~/.vimrc

vim -c "call CommandLinePluginInstall()"

~/.vim/bundle/YouCompleteMe/install.py

sed -i 's/"colorscheme/colorscheme/' ~/.vimrc
#
ldd /usr/bin/python2.7
#
~/.vim/bundle/YouCompleteMe/install.py 
#
#
~/.vim/bundle/YouCompleteMe/install.py 
#
sudo yum remove gcc-c++
#
sudo chmod 0644 1ibm-openclient-hourly 
#
cd /tmp/
#
###
## install htop
###
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
#
sudo rpm -ihv epel-release-7-9.noarch.rpm 
#
sudo yum install htop
#

####
## download rpi img
####
mkdir -p imgs
cd imgs
wget https://downloads.raspberrypi.org/raspbian_lite_latest
sudo yum install qemu qemu-user-static
sudo yum install unzip
#
wget https://downloads.raspberrypi.org/raspbian_lite_latest -O debian-jessie.zip
#
unzip debian-jessie.zip 
#
dd if=/dev/zero bs=1M count=1024 >> 2017-03-02-raspbian-jessie-lite.img 
# add kernel module for loop
sudo modprobe loop
# 70254592 is block of linux partition (second) * 512
sudo mount -o loop,offset=70254592 "/home/mgazzx/imgs/2017-03-02-raspbian-jessie-lite.img" /mnt/
# this is the first partition
sudo mount -o loop,offset=4194304 "/home/mgazzx/imgs/2017-03-02-raspbian-jessie-lite.img" /mnt/boot
#
wget ftp://195.220.108.108/linux/mageia/distrib/cauldron/x86_64/media/core/release/qemu-user-static-2.8.0-4.mga6.x86_64.rpm
#
cd /tmp/
#
wget http://download.qemu-project.org/qemu-2.8.0.tar.xz
#
extract qemu-2.8.0.tar.xz 
#
cd qemu-2.8.0/
#
git clone git://git.qemu-project.org/qemu.git
#
cd qemu
#
git submodule init
#
git submodule update --recursive
#
sudo yum install gcc-c++
#
