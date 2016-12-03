#need readline 

#gcc
#readline
#openssl

if ! [[ -e "$HOME/.rbenv" ]]; then
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

#if [[ $(rbenv versions | grep "$ruby_version") == "" ]]; then
#	rbenv install "$ruby_version"
#	rbenv global "$ruby_version"
#fi


export LD_LIBRARY_PATH="/home/$USER/local/lib64:/home/$USER/local/lib"

CONFIGURE_OPTS="--without-tcl --without-tk --without-X11" /home/$USER/.rbenv/bin/rbenv install 2.3.3
rbenv global 2.3.3
#
#

