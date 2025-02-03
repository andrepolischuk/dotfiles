# Setup sourses
source "$HOME/.aliases"

# Setup locales
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8

# Setup editor and viewer
export EDITOR='vim'
export MANPAGER='less -X';

# Append to the history file, increase bash history size
shopt -s histappend
export HISTSIZE=32768
export HISTFILESIZE="$HISTSIZE"

# Setup $PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$(pyenv root)/shims:$PATH"

# Setup $CPATH
export CPATH="/opt/homebrew/include:$CPATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"

# Setup prompt
user_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "$USER@$HOSTNAME "
  elif [[ $LOGNAME != $USER || $USER == "root" ]]; then
    echo "$USER "
  fi
}
git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1='→ $(user_host)\[\e[1m\]\W\[\e[0m\]$(git_branch): '
export PS2='... '

# Disable "default interactive shell is now zsh" warning on macOS
export BASH_SILENCE_DEPRECATION_WARNING=1
