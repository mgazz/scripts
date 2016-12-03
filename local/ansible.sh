#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :03.12.16
#notes           :
#==============================================================================


######
### ansible to finish
######
git clone git://github.com/ansible/ansible.git --recursive
#
cd ansible/
#
pip install --install-option="--prefix=/home/$USER/local" ansible

