#!/bin/bash

# ==================================================================================
# configuration
# ==================================================================================

# where to install?
TARGETDIR=$HOME


# ==================================================================================
# functions
# ==================================================================================

source baseenv.sh

# ==================================================================================
# prime the system with brew and GNU coreutils
# ==================================================================================

echo Starting bootstrap…

if [ $(uname) = 'Darwin' ]
then
  echo Checking homebrew…
  command -v brew >/dev/null 2>&1 || {
  #command -v brew >/dev/null 2>&1 && brew update || {
    echo Installing homebrew…
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
  }
  command -v gls >/dev/null 2>&1 || {
    echo Installing GNU coreutils via brew…
    brew install coreutils
  }
else
  echo >&2 Unsupported OS: \'$(uname)\'
  exit 1
fi


# ==================================================================================
# zsh and oh-my-zsh installation and config
# ==================================================================================

echo Checking for oh-my-zsh…

if [ ! -d $TARGETDIR/.oh-my-zsh ]
then
  echo Not found, installing…
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
else
  echo Found oh-my-zsh!
fi

if [ -d $U_OMZ_PLUGINDIR ]
then
  if [ $(gnu readlink -f $U_OMZ_PLUGINDIR) = $U_BASEDIR/ohmyzsh-plugins ]
  then
    echo Custom oh-my-zsh plugin dir is already linked ":)"
  else
    echo >&2 "$U_OMZ_PLUGINDIR already exists!"
    exit 1
  fi
else
  echo Linking plugindir
  ln -s $U_BASEDIR/ohmyzsh-plugins $HOME/.oh-my-zsh/custom/plugins
fi

if [ -d $U_OMZ_THEMEDIR ]
then
  if [ $(gnu readlink -f $U_OMZ_THEMEDIR) = $U_BASEDIR/ohmyzsh-themes ]
  then
    echo Custom oh-my-zsh theme dir is already linked ":)"
  else
    echo >&2 "$U_OMZ_THEMEDIR already exists!"
    exit 1
  fi
else
  echo Linking themedir
  ln -s $U_BASEDIR/ohmyzsh-themes $HOME/.oh-my-zsh/custom/themes
fi

if [ -f ~/.zshrc ]
then
  if [ $(gnu readlink -f ~/.zshrc) = $U_BASEDIR/dot_zshrc ]
  then
    echo .zshrc is already linked ":)"
  else
    echo >&2 ".zsrc already exists!"
    exit 1
  fi
else
  echo Linking .zshrc
  ln -s $U_BASEDIR/dot_zshrc $HOME/.zshrc
fi
