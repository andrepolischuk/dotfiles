#!/usr/bin/env bash

# Update dotfiles
cd $DOTFILES
git pull

# Update zsh
cd $HOME/.oh-my-zsh
git pull --rebase --stat origin master

# Update zsh plugins
for plugin in $(ls -1d $HOME/.oh-my-zsh/custom/plugins/*); do
  if [ -z $(echo $plugin | grep example) ]; then
    cd $plugin
    git pull
  fi
done

# Update brew packages
command -v brew >/dev/null 2>&1 && {
  brew update
  brew upgrade
  brew prune
  brew cleanup
}

# Update ubuntu packages
command -v apt-get >/dev/null 2>&1 && {
  sudo apt-get update
  sudo apt-get upgrade -y
  sudo apt-get autoremove -y
  sudo apt-get autoclean -y
}

# Update npm packages
command -v npm >/dev/null 2>&1 && {
  npm -g outdated --parseable=true | cut -d : -f 4 | xargs -n 1 npm -g install
  npm cache clean
}

# Update vim plugins
for plugin in $(ls -1d $HOME/.vim/bundle/*); do
  cd $plugin
  git pull
done

echo "Dotfiles updated successfully! Please restart your terminal!"
