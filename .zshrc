# setup zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(git)

# add ssh key
# ssh-add ~/.ssh/id_rsa

# add sourses
source $HOME/.exports
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# add completions
fpath=(~/.oh-my-zsh/completions $fpath)
autoload -U compinit && compinit

# tmuxinator
type mux > /dev/null && test -z $TMUX
