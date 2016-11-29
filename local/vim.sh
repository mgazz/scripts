#!/bin/bash

#python different lib path based on different architectures
ARC=`uname -a | awk '{print $12}'`
if [ "$ARC" =  "x86_64" ]; then
	PY_CONF_DIR="/usr/lib/python2.7/config-x86_64-linux-gnu"
fi
if [ "$ARC" = "i686" ]; then
	PY_CONF_DIR="/usr/lib/python2.7/config-i386-linux-gnu"
fi

echo $PY_CONF_DIR

#vim setup
#cp -rn ~/dot-files/.vim ~/
#cp -n ~/dot-files/.vimrc ~/


#download vundle to install plugins
if [[ ! -e "$HOME/.vim/bundle" && $use_vundle ]]; then
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

#download vim source

echo $vim_dest

mkdir -p "$vim_dest"
if ! [ -d "$vim_dest/vim74" ]; then
    wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2 -O vim.tar.bz2
    tar -xjvf vim.tar.bz2 -C ~/workspace/extensions/
    rm vim.tar.bz2
fi

sudo ln -s /usr/include/x86_64-linux-gnu/ruby-*/ruby/config.h /usr/include/ruby-*/ruby/


#compile vim source
cd ~/workspace/extensions/vim74/src
sudo make distclean
sudo ./configure --prefix=/usr/local \
	--enable-gui=gnome2 \
    --with-features=huge \
	--enable-cscope \
    --enable-multibyte \
	--enable-rubyinterp \
	--enable-pythoninterp \
	--with-python-config-dir=$PY_CONF_DIR \
	--with-tlib=ncurses \
    --enable-luainterp 
sudo make clean
sudo make 
sudo make install 
#sudo make clean

# prevent vim errors
#if [[ $(cat "$HOME/.vim/conf/colors.vim" | grep "colorscheme") != "" ]]; then
    #color_path="$home/.vim/conf/colors.vim"
    #sed -i 's/colorscheme/"colorscheme/' "$color_path"
#fi

color_path="$HOME/.vim/conf/colors.vim"

if [[ $(cat "$color_path" | grep "colorscheme") != "" ]]; then
    echo change
    sed -i 's/colorscheme/"colorscheme/' "$color_path"
fi

vim -c "call CommandLinePluginInstall()"

~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

#re-activate colorscheme
sed -i 's/"colorscheme/colorscheme/' "$color_path"

