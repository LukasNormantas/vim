#!/bin/bash
SCRIPT_DIR=$(dirname $(readlink -f $0))
INITIAL_DIR=`pwd`
cd ~
rm -rf ~/.vim && ln -s $SCRIPT_DIR/.vim ~/.vim
rm ~/.vimrc && ln -s $SCRIPT_DIR/.vimrc ~/.vimrc
cd $SCRIPT_DIR
git submodule update
