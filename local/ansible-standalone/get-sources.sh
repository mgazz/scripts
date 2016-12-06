#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :06.12.16
#notes           :
#==============================================================================


if [[ ! -d  "./openssl-1.0.2j" ]]; then
    wget https://www.openssl.org/source/openssl-1.0.2j.tar.gz
    tar xvzf openssl-1.0.2j.tar.gz
    rm openssl-1.0.2j.tar.gz
else
    echo OPENSSL PRESENT
fi

if [[ ! -d "./Python-2.7.12" ]]; then
    wget https://www.python.org/ftp/python/2.7.12/Python-2.7.12.tar.xz
    tar xvfJ Python-2.7.12.tar.xz
    rm Python-2.7.12.tar.xz
else
    echo PYTHON PRESENT
fi
if [[ ! -f "./get-pip.py" ]]; then
    wget https://bootstrap.pypa.io/get-pip.py
fi
if [[ ! -d "./asciidoc-8.6.9" ]]; then
    wget http://sourceforge.net/projects/asciidoc/files/asciidoc/8.6.9/asciidoc-8.6.9.tar.gz
    tar xvzf asciidoc-8.6.9.tar.gz
    rm asciidoc-8.6.9.tar.gz
else
    echo ASCII PRESENT
fi
if [[ ! -d "./libffi-3.2.1" ]]; then
    wget ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz
    tar xvzf libffi-3.2.1.tar.gz
    rm libffi-3.2.1.tar.gz
else
    echo LIBFFI PRESENT
fi
if [[ ! -d "./ansible" ]]; then
    git clone https://github.com/ansible/ansible.git
fi

