#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :29.11.16
#notes           :
#==============================================================================

mkdir -p /home/$USER/local

mkdir -p /tmp/compile

cd /tmp/compile

git clone https://github.com/vim/vim.git

cd vim

./configure --prefix=/home/$USER/local \
    --enable-gui=gnome2 \
    --with-features=huge \
    --enable-gui=auto \
    --enable-cscope \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --with-tlib=ncurses \
    --enable-luainterp

make

make install

# autoload plugin
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#color_path="$HOME/.vim/conf/colors.vim"

#if [[ $(cat "$color_path" | grep "colorscheme") != "" ]]; then
    #echo change
    #sed -i 's/colorscheme/"colorscheme/' "$color_path"
#fi

#vim -c "call CommandLinePlugInstall()"

#/home/$USER/.vim/plugged/YouCompleteMe/install.sh --clang-completer

#re-activate colorscheme
#sed -i 's/"colorscheme/colorscheme/' "$color_path"

echo 'to uninstall cd /tmp/compile/vim && make uninstall'


