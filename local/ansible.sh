#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :03.12.16
#notes           :
#==============================================================================


######
### ansible to finish
######
#mkdir -p /tmp/compile

#cd /tmp/compile

#git clone git://github.com/ansible/ansible.git --recursive
#
#cd ansible/

./asciidoc.sh

export LD_LIBRARY_PATH="/home/$USER/local/lib64:/home/$USER/local/lib"

# gloabal option for centos
pip install --global-option=build_ext --global-option="-I/home/$USER/local/lib/libffi-3.2.1/include" --install-option="--prefix=/home/$USER/local" ansible

