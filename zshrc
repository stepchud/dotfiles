. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# local settings specific to one system
[[ -e ~/localized/ ]] && for file in $HOME/localized/*; do source $file; done

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
