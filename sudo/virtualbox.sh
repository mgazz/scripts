#!/bin/bash -       
#description     :virtualbox install script
#author          :Michele Gazzetti
#date            :14.04.16
#notes           :
#==============================================================================

### Variables

### Script start

#sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list'
#wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
#sudo apt-get install -y virtualbox-4.3
sudo apt-get install -y virtualbox
sudo apt-get install -y virtualbox-guest-additions-iso
