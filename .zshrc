# Locales
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8

# Provide dotfiles path
export DOTFILES=$(dirname $(readlink ${(%):-%N}))

# Setup editor
export EDITOR='vim'

# Setup $PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$(pyenv root)/shims:$PATH"

# Setup $CPATH
export CPATH="/opt/homebrew/include:$CPATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"

# Setup zsh
ZSH="$HOME/.oh-my-zsh"
DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git npm yarn brew min zsh-autosuggestions zsh-syntax-highlighting)

# Add sourses
source "$ZSH/oh-my-zsh.sh"
source "$DOTFILES/.aliases"

# Add completions
fpath=(~/.oh-my-zsh/completions $fpath)
autoload -U compinit && compinit

# Set plugin defaults
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=247"
