#!/bin/sh

# Setup paths
mkdir -p ~/.vim/.backup
mkdir -p ~/.vim/.tmp
mkdir -p ~/.vim/.undo

# Setup Vundle
mkdir -p ~/.vim/bundle
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo Launch vim, run :BundleInstall

#vim +BundleInstall +qall
