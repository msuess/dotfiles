#!/bin/sh

# Check if a command exists or abort
checkExe()
{
  command -v $1 >/dev/null 2>&1 || { echo >&2 "I require $1 but it's not installed.  Aborting."; exit 1; }
}

checkExe vim    # duh
checkExe make
checkExe git
checkExe ruby
checkExe node
checkExe npm

# require >= ViM 7.3
MIN_VIM_MAJOR=7
MIN_VIM_MINOR=3

IS_DARWIN=$([ $(uname) = 'Darwin' ])

VIM_VERSION=$(vim --version | head -1 | sed -e 's/ (.*)$//'| sed -e 's/^[^0-9]*\([0-9.]*\)$/\1/')
VIM_MAJOR=$(echo $VIM_VERSION | cut -d. -f1)
VIM_MINOR=$(echo $VIM_VERSION | cut -d. -f2)

[ "$VIM_MAJOR" -ge "$MIN_VIM_MAJOR" ] && [ "$VIM_MINOR" -ge "$MIN_VIM_MINOR" ] || {
    echo >&2 "I require ViM >= $MIN_VIM_MAJOR.$MIN_VIM_MINOR but $VIM_VERSION is installed. Aborting."
    exit 1
}

OLDDIR=$(pwd)

echo Creating directories
# Setup paths
mkdir -p ~/.vim/.backup
mkdir -p ~/.vim/.tmp
mkdir -p ~/.vim/.undo

mkdir -p ~/.vim/.yankring

# Setup Vundle
echo Installing Vundle
mkdir -p ~/.vim/bundle
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo Creating bootstrap ~/.vimrc

echo 'fun! MySys()' > ~/.vimrc

if $IS_DARWIN; then
    echo Apple MacOS X detected
    echo '  return "mac"' >> ~/.vimrc
else
    echo Linux detected
    echo '  return "linux"' >> ~/.vimrc
fi
echo 'endfun' >> ~/.vimrc
echo 'source ~/.vim/vimrc' >> ~/.vimrc


echo Installing Bundles
vim +BundleInstall +qall


echo Finalizing Bundles

# Command-T C Compilation
cd ~/.vim/bundle/command-t/ruby/command-t/
ruby extconf.rb
make

# tern.js installation
cd ~/.vim/bundle/tern_for_vim/
npm install

cd $OLDDIR
