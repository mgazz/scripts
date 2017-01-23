#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :03.12.16
#notes           :
#==============================================================================

BASE_DIR="$PWD"
PREFIX_DIR="$BASE_DIR/local"


export PYTHONPATH=$PREFIX_DIR/lib

chmod +x ./ansible/hacking/env-setup

./ansible/hacking/env-setup

######
### ansible to finish
######

export LD_LIBRARY_PATH="$PREFIX_DIR/lib64:$PREFIX_DIR/lib"

export PKG_CONFIG_PATH=$PREFIX_DIR/lib/pkgconfig

# gloabal option for centos
#/home/$USER/.local/bin/pip install --global-option=build_ext --global-option="-I$PREFIX_DIR/include" --install-option="--prefix=$PREFIX_DIR" ansible
#/home/$USER/.local/bin/pip install --global-option=build_ext --global-option="-I$PREFIX_DIR/include" --install-option="--prefix=$PREFIX_DIR" urllib3 --upgrade
/home/$USER/.local/bin/pip install --global-option=build_ext --global-option="-I$PREFIX_DIR/include" --install-option="--prefix=$PREFIX_DIR" urllib3 --upgrade

