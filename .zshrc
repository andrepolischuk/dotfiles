# Setup zsh
ZSH=$HOME/.oh-my-zsh
COMPLETION_WAITING_DOTS="true"
plugins=(git github osx npm brew vagrant)

# Dotfiles path
export DOTFILES=$HOME/.dotfiles

# Add sourses
source $DOTFILES/.exports
source $ZSH/oh-my-zsh.sh
source $DOTFILES/.aliases
source $DOTFILES/lib/neat/neat.zsh
source $DOTFILES/lib/gitio-zsh/gitio.plugin.zsh

# Add completions
fpath=(~/.oh-my-zsh/completions $fpath)
autoload -U compinit && compinit
