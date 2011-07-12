# echo $PATH
export HISTCONTROL="erasedups:ignoreboth"
export HISTFILESIZE=500000
export HISTSIZE=100000
export HISTIGNORE="&:[ ]*:exit"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

stty stop ""

source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/functions

# .bashrc used for non-interactive login ENVs
if [ -f ~/.bashrc ]
then
  # echo bashrc init...
  source ~/.bashrc
fi

# use .local_profile for settings specific to one system
if [ -f ~/.local_profile ]
then
  echo localizing...
  source ~/.local_profile
fi

# setup ruby version manager
if [[ -s /usr/local/rvm/scripts/rvm ]] ; then source /usr/local/rvm/scripts/rvm ; fi

# rvm --default 1.9.2-rc2

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export PS1='[\[\033[0;31m\]\u@\h:\[\033[0;33m\]\W\[\033[1;34m\]$(__git_ps1 " (%s)")\[\033[0m\]]\$ '
# export PATH=~/bin:~/local/node/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/bin:$PATH
export CDPATH=.:~:~/code:~/Documents:/usr/local/rvm/gems/ruby-1.9.2-p0\@spiceworks/gems
