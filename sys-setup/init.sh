#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :25.02.17
#notes           :
#==============================================================================
sudo apt-get update

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get  update
#

sudo apt-get install rxvt-unicode-256color \
    i3 \
    trash-cli \
    scrot \
    tmux \
    spotify-client \
    google-chrome-stable \
    htop \
    python-dev \
    cmake \
    libncurses-dev \
    vagrant \
    ansible \
    vim -y

git clone https://github.com/mgazz/dotfiles.git /home/$USER/dotfiles
make -C /home/$USER/dotfiles

#/home/$USER/scripts/sys-setup/vim.sh



