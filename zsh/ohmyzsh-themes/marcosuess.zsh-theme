local _MAX_PATH_LENGTH=20
local _MAX_VCS_TOPDIR_LENGTH=20

local _machine_prefix=''
if [ $SSH_CONNECTION ]; then
    _machine_prefix="%m "
fi

local _short_path="%$_MAX_PATH_LENGTH<..<%~%<<"

function _MS_git_ref() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

function _MS_vcs_prompt() {
  local _is_git=$(command git rev-parse --short HEAD 2> /dev/null);
  local _prompt=""
  if [ "$_is_git" ]; then
    local _toplevel=$(command git rev-parse --show-toplevel 2> /dev/null)
    local _subdir=$(pwd | sed -e "s#$_toplevel/*##")
    if [ "$_subdir" ]; then
      _subdir=" $_subdir"
    fi
    _toplevel=$(echo "$_toplevel" | sed -e 's#.*/##g')
    _prompt="%{$FG[010]%}%$_MAX_VCS_TOPDIR_LENGTH<…<$_toplevel%<< %{$fg[red]%}$(_MS_git_ref)%{$fg[green]%}%$_MAX_PATH_LENGTH<…<$_subdir%<<$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  else
    _prompt="%{$fg[green]%}%$_MAX_PATH_LENGTH<…<%~%<<"
  fi
  echo $_prompt
}

PROMPT=$_machine_prefix'%{$fg[blue]%}> %{$fg[green]%}%p %{$fg[blue]%}$(_MS_vcs_prompt)%{$fg[blue]%} %# %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="±(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%} %{$fg[yellow]%}±%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
