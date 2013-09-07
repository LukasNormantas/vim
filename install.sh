#!/bin/bash

# This script links system VIM config files to the content of 
# this directory, it only has to be ran once after cloning
# this directory from git.

SCRIPT_DIR=$(dirname $(readlink -f $0))
INITIAL_DIR=`pwd`

cd $SCRIPT_DIR
git submodule update

cd ~
rm -rf ~/.vim && ln -s $SCRIPT_DIR/.vim ~/.vim
rm ~/.vimrc && ln -s $SCRIPT_DIR/.vimrc ~/.vimrc

cd $INITIAL_DIR
