# BASH ENV
export HISTCONTROL="erasedups:ignoreboth"
export HISTFILESIZE=500000
export HISTSIZE=100000
export HISTIGNORE="&:[ ]*:exit"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
# add sbin (rabbitmq) to path
export PATH="~/bin:/usr/local/sbin:$PATH"

stty stop ""

# dotfiles additions
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/functions
source ~/.bash/ps1

# .bashrc is for non-interactive login ENVs
if [ -f ~/.bashrc ]; then source ~/.bashrc; fi

# Local, non-shared configurations
# add configuration that is specific to this machine/environmnet
# and should not be shared across environments
# for settings specific to one system (e.g. mac vs. linux differences)
if [ -f ~/.bash_environment ]; then
  # echo 'local .bash_environment'
  source ~/.bash_environment
else
  echo 'no bash_environment'
fi

if which rbenv > /dev/null; then
  # echo rbenv init
  eval "$(rbenv init -)";
else
  echo 'no rbenv'
fi

# configure nvm
if [ -d "$HOME/.nvm" ]; then
  # echo nvm init
  export NVM_DIR="$HOME/.nvm"
  . $(brew --prefix nvm)/nvm.sh
  if [ -s "$NVM_DIR/bash_completion" ]; then
    # echo nvm bash_completion
    . "$NVM_DIR/bash_completion"; # load nvm bash_completion
  else echo 'no nvm completion'
  fi
else
  echo 'no nvm'
fi
