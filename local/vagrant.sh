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
#
bundle install
#
bundle --binstubs /home/mgazz/local/bin
#
