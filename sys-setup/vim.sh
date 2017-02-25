#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :25.02.17
#notes           :
#==============================================================================


#python different lib path based on different architectures
ARC=`uname -a | awk '{print $12}'`
if [ "$ARC" =  "x86_64" ]; then
	PY_CONF_DIR="/usr/lib/python2.7/config-x86_64-linux-gnu"
fi
if [ "$ARC" = "i686" ]; then
	PY_CONF_DIR="/usr/lib/python2.7/config-i386-linux-gnu"
fi
echo $PY_CONF_DIR

mkdir -p /home/$USER/local

git clone https://github.com/vim/vim.git /tmp/vim

/tmp/vim/configure --prefix=/home/$USER/local \
    --enable-gui=gnome2 \
    --with-features=huge \
    --enable-cscope \
    --enable-multibyte \
    --enable-luainterp \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --with-python-config-dir=$PY_CONF_DIR \
    --with-tlib=ncurses 

make install -C /tmp/vim/

mkdir -p ~/.vim/bundle

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

sed -i 's/colorscheme/"colorscheme/' ~/.vimrc

vim -c "call CommandLinePluginInstall()"

~/.vim/bundle/YouCompleteMe/install.py

#re-activate colorscheme
sed -i 's/"colorscheme/colorscheme/' ~/.vimrc
