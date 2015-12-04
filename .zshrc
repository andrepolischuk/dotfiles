# Setup ZSH
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

# Add ssh key
# ssh-add ~/.ssh/id_rsa

# Add sourses
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.exports
source $HOME/.bin/tmuxinator.zsh

# Add completions
fpath=(~/.oh-my-zsh/completions $fpath)
autoload -U compinit && compinit
