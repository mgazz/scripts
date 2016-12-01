#!/bin/bash -       
#description     :
#author          :Michele Gazzetti
#date            :29.11.16
#notes           :
#==============================================================================


mkdir -p /home/$USER/local

mkdir -p /tmp/compile

cd /tmp/compile
##http://stackoverflow.com/questions/9450394/how-to-install-gcc-piece-by-piece-with-gmp-mpfr-mpc-elf-without-shared-libra
wget http://www.netgull.com/gcc/releases/gcc-6.2.0/gcc-6.2.0.tar.bz2
#
tar xvjf gcc-6.2.0.tar.bz2
#
cd gcc-6.2.0/
echo "
#! /bin/sh

# Download some prerequisites needed by gcc.
# Run this from the top level of the gcc source tree and the gcc
# build will do the right thing.
#
# (C) 2010 Free Software Foundation
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see http://www.gnu.org/licenses/.

# If you want to disable Graphite loop optimizations while building GCC,
# DO NOT set GRAPHITE_LOOP_OPT as yes so that the isl package will not
# be downloaded.
GRAPHITE_LOOP_OPT=yes

if [ ! -e gcc/BASE-VER ] ; then
        echo "You must run this script in the top level GCC source directory."
        exit 1
fi

# Necessary to build GCC.
MPFR=mpfr-2.4.2
GMP=gmp-4.3.2
MPC=mpc-0.8.1

#wget ftp://gcc.gnu.org/pub/gcc/infrastructure/$mpfr.tar.bz2 || exit 1
wget http://www.netgull.com/gcc/infrastructure/$MPFR.tar.bz2 || exit 1
tar xjf $MPFR.tar.bz2 || exit 1
ln -sf $MPFR mpfr || exit 1

#wget ftp://gcc.gnu.org/pub/gcc/infrastructure/$GMP.tar.bz2 || exit 1
wget http://www.netgull.com/gcc/infrastructure/$GMP.tar.bz2 || exit 1
tar xjf $GMP.tar.bz2  || exit 1
ln -sf $GMP gmp || exit 1

#wget ftp://gcc.gnu.org/pub/gcc/infrastructure/$MPC.tar.gz || exit 1
wget http://www.netgull.com/gcc/infrastructure/$MPC.tar.gz || exit 1
tar xzf $MPC.tar.gz || exit 1
ln -sf $MPC mpc || exit 1

# Necessary to build GCC with the Graphite loop optimizations.
if [ "$GRAPHITE_LOOP_OPT" = "yes" ] ; then
  ISL=isl-0.15

  #wget ftp://gcc.gnu.org/pub/gcc/infrastructure/$ISL.tar.bz2 || exit 1
  wget http://www.netgull.com/gcc/infrastructure/$ISL.tar.bz2 || exit 1
  tar xjf $ISL.tar.bz2  || exit 1
  # Fix trailing comma which errors with -pedantic for host GCC <= 4.3
  sed -e 's/isl_stat_ok = 0,/isl_stat_ok = 0/' isl-0.15/include/isl/ctx.h > isl-0.15/include/isl/ctx.h.tem && mv isl-0.15/include/isl/ctx.h.tem isl-0.15/include/isl/ctx.h
  ln -sf $ISL isl || exit 1
fi


" > .contrib/download_prerequisites

./contrib/download_prerequisites

#
cd ..
#
mkdir objdir
#
cd objdir/
#
unset LIBRARY_PATH CPATH C_INCLUDE_PATH PKG_CONFIG_PATH CPLUS_INCLUDE_PATH INCLUDE LD_LIBRARY_PATH
#
$PWD/../gcc-6.2.0/configure --prefix=/home/$USER/local --enable-shared --with-pic --disable-multilib --enable-languages=c,c++,go,java

make -j 4

make install
#
