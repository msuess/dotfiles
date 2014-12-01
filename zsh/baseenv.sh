#!/bin/sh

#source $(dirname $0)/loader-extended.sh

local _array_prefix='__U_ARR_'

arraySet() {
  local array=$1 index=$2 value=$3
  eval "$_array_prefix$array""_$index=$value"
}

arrayGet() {
  local array=$1 index=$2
  local i="$_array_prefix${array}_$index"
  printf '%s' "${!i}"
}

arrayContains() {
  local array=$1 index=$2
  local i="$_array_prefix${array}_$index"
  eval "echo \$$i"
}

local _u_included=_U_INCLUDED

arraySet $_u_included baseenv 1

#_U_INCLUDE_DEBUG=1

include() {
  local normalized=$(echo $@ | md5)
  local in_array=$(arrayContains $_u_included $normalized)
  if [ $_U_INCLUDE_DEBUG ]
  then
    echo Loading $@
  fi
  if [ $in_array ]
  then
    if [ $_U_INCLUDE_DEBUG ]
    then
      echo $@ is already loaded!
    fi
  else
    arraySet $_u_included $normalized 1
    source $@
  fi
}

include $(dirname $0)/sh-utils/gnuify.sh

U_SCRIPT=$(gnu readlink -f $0)
U_BASEDIR=$(dirname $U_SCRIPT)
U_OMZ_PLUGINDIR=$HOME/.oh-my-zsh/custom/plugins
U_OMZ_THEMEDIR=$HOME/.oh-my-zsh/custom/themes
