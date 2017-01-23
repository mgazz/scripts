cd /tmp
git clone https://github.com/vim/vim.git
./configure --prefix=/home/$USER     --enable-gui=gnome2     --with-features=huge     --enable-cscope     --enable-multibyte     --enable-rubyinterp     --enable-pythoninterp     --with-tlib=ncurses     --enable-luainterp
make install
