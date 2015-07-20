# echo $PATH
export HISTCONTROL="erasedups:ignoreboth"
export HISTFILESIZE=500000
export HISTSIZE=100000
export HISTIGNORE="&:[ ]*:exit"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

stty stop ""

# dotfiles additions
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/functions

# .bashrc used for non-interactive login ENVs
if [ -f ~/.bashrc ]
then
  # echo bashrc init...
  source ~/.bashrc
fi

# Local, non-shared configurations
# add configuration that is specific to this machine/environmnet
# and should not be shared across environments
# for settings specific to one system (e.g. mac vs. linux differences)

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -e $HOME/localized/ ]; then
  for file in $HOME/localized/*; do source $file; done
  __localized_to
  echo "localized to $LOCAL_ENV"
else
  echo 'localizations missing.'
fi

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export PS1='[\[\033[0;31m\]\u@\h:\[\033[0;33m\]\W\[\033[1;34m\]$(__git_ps1 " (%s)")\[\033[0m\]]\$ '
export PATH=~/bin:/usr/local/sbin:$PATH

# export JRUBY_OPTS="--1.9 -J-XX:PermSize=512m -J-XX:MaxPermSize=768m -J-server -J-Xmx2048m -J-Xms1024m -J-Djruby.reflection=true -J-Djruby.compile.mode=OFF -J-Djruby.debug.fullTrace=true -J-Djsse.enableSNIExtension=false --debug"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
source ~/.bash_environment
