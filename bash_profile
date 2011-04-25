# echo $PATH
export HISTCONTROL="erasedups:ignoreboth"
export HISTFILESIZE=500000
export HISTSIZE=100000
export HISTIGNORE="&:[ ]*:exit"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export PATH=~/bin:$PATH

stty stop ""

source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/functions

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

# uncomment for Fink to work
# Test -r /sw/bin/init.sh && . /sw/bin/init.sh

# setup ruby version manager
if [[ -s /usr/local/rvm/scripts/rvm ]] ; then source /usr/local/rvm/scripts/rvm ; fi

# rvm --default 1.9.2-rc2

# bash_prompt() {
#   local NONE="\[\033[0m\]"    # unsets color to term's fg color
# 
#   # regular colors
#   local K="\[\033[0;30m\]"    # black
#   local R="\[\033[0;31m\]"    # red
#   local G="\[\033[0;32m\]"    # green
#   local Y="\[\033[0;33m\]"    # yellow
#   local B="\[\033[0;34m\]"    # blue
#   local M="\[\033[0;35m\]"    # magenta
#   local C="\[\033[0;36m\]"    # cyan
#   local W="\[\033[0;37m\]"    # white
# 
#   # emphasized (bolded) colors
#   local EMK="\[\033[1;30m\]"
#   local EMR="\[\033[1;31m\]"
#   local EMG="\[\033[1;32m\]"
#   local EMY="\[\033[1;33m\]"
#   local EMB="\[\033[1;34m\]"
#   local EMM="\[\033[1;35m\]"
#   local EMC="\[\033[1;36m\]"
#   local EMW="\[\033[1;37m\]"
# 
#   # background colors
#   local BGK="\[\033[40m\]"
#   local BGR="\[\033[41m\]"
#   local BGG="\[\033[42m\]"
#   local BGY="\[\033[43m\]"
#   local BGB="\[\033[44m\]"
#   local BGM="\[\033[45m\]"
#   local BGC="\[\033[46m\]"
#   local BGW="\[\033[47m\]"
# 
#   local UC=$W                 # user's color
#   [ $UID -eq "0" ] && UC=$R   # root's color
# 
#   # PS1="$B\$(rvm-prompt i v g)$Y$W:$EMY\w$EMW${NONE} $ "
# }
# 
# bash_prompt
# unset bash_prompt

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export PS1='[\[\033[0;31m\]\u@\h:\[\033[0;33m\]\W\[\033[1;34m\]$(__git_ps1 " (%s)")\[\033[0m\]]\$ '
