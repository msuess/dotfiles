if [ -f ~/.env ]; then
  . ~/.env
fi

#cat $(dirname $(gnu readlink -f $0))/logo

#ZDEBUG=1
U_ZDOTDIR=$U_BASEDIR/zsh-config
ZDOTDIR=$U_ZDOTDIR
[ -f $U_ZDOTDIR/.zshenv ] && . $U_ZDOTDIR/.zshenv
[ -f $U_ZDOTDIR/.zshrc ] && . $U_ZDOTDIR/.zshrc
