#!/bin/sh

gnuify() {
  if [ $(uname) = 'Darwin' ]
  then
    echo g$@
  else
    echo $@
  fi
}

gnu() {
  $(gnuify $@)
}
