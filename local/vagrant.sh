#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :03.12.16
#notes           :
#==============================================================================


######
## vagrant
#####
#source: www.vagrantup.com/docs/installation/source.html

# need curl
# need git

# need ruby!

mkdir -p /tmp/compile

cd /tmp/compile/
#
git clone https://github.com/mitchellh/vagrant.git
#
cd vagrant/
#
export LD_LIBRARY_PATH="/home/$USER/local/lib64:/home/$USER/local/lib"
#
gem install bundler
gem install rake -v '11.3.0'
#
bundle install
#
bundle --binstubs /home/$USER/local/bin
#
