##
# gnu coreutils from brew

if [ $(uname) = 'Darwin' ];
then
  PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

# vim:ft=zsh
