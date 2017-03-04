#!/bin/bash
# ruby setup

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build


if grep -Fxp "PATH=\"\$HOME/.rbenv/bin:\$PATH\"" ~/.profile
then
	echo ""
else
	echo "PATH=\"\$HOME/.rbenv/bin:\$PATH\"" >> ~/.profile
fi
if grep -Fxp "eval \"\$(rbenv init -)\"" ~/.profile
then
	echo ""
else
	echo "eval \"\$(rbenv init -)\"" >> ~/.profile
fi

source ~/.profile

rbenv install 2.1.3
rbenv global 2.1.3
