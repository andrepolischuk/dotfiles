# Setup zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git github osx npm brew vagrant)

# Add sourses
source $HOME/.exports
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# Add completions
fpath=(~/.oh-my-zsh/completions $fpath)
autoload -U compinit && compinit
