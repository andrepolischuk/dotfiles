#!/usr/bin/env bash

# Update dotfiles
cd $DOTFILES
git pull

# Update zsh
cd $HOME/.oh-my-zsh
git pull --rebase --stat origin master

# Update zsh plugins
ls -1d $HOME/.oh-my-zsh/custom/plugins/* | xargs -I % bash -c 'cd %; git pull'

# Update brew packages
command -v brew >/dev/null 2>&1 && {
  brew update
  brew upgrade
}

# Update ubuntu packages
command -v apt-get >/dev/null 2>&1 && {
  sudo apt-get update
  sudo apt-get upgrade -y
}

# Update npm packages
command -v npm >/dev/null 2>&1 && {
  npm -g outdated --parseable=true | cut -d : -f 4 | xargs -n 1 npm -g install
}

# Update vim plugins
ls -1d $HOME/.vim/bundle/* | xargs -I % bash -c 'cd %; git pull'

# Upgrade macOS
sudo softwareupdate -iaR

echo "Updating completed successfully! Please restart your terminal!"
