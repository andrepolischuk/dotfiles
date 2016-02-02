# Setup zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

# Add sourses
source $HOME/.exports
source $HOME/.aliases
source $ZSH/oh-my-zsh.sh

# Add completions
fpath=(~/.oh-my-zsh/completions $fpath)
autoload -U compinit && compinit

# Tmuxinator
type mux > /dev/null && test -z $TMUX
