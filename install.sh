#!/bin/bash

# This script links system VIM config files to the content of 
# this directory, it only has to be ran once after cloning
# this directory from git.

SCRIPT_DIR=$(dirname $(readlink -f $0))
INITIAL_DIR=`pwd`

cd $SCRIPT_DIR
git submodule init
git submodule update

cd ~
ln --backup -sn $SCRIPT_DIR/.vim ~/.vim
ln --backup -s $SCRIPT_DIR/.vimrc ~/.vimrc
ln --backup -s $SCRIPT_DIR/.vimrc.local ~/.vimrc.local

cd $INITIAL_DIR
