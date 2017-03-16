#!/usr/bin/env bash

# Ask for password
sudo -v

# Export dotfiles directory
init_dirname=$(dirname $0)

if [[ $init_dirname == '.' ]]; then
  export DOTFILES="$PWD"
else
  export DOTFILES="$PWD/$init_dirname"
fi

# Preinstall
if ! hash git zsh vim ag 2>/dev/null ; then
  if [ `uname` == 'Darwin' ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install git zsh vim the_silver_searcher
  elif [ `uname` == 'Linux' ]; then
    sudo apt-get install git zsh vim silversearcher-ag
  else
    echo "git, zsh, vim and ag is required"
    exit
  fi
fi

# Registers zsh as a default shell
zsh_path=$(which zsh)

if [ -z `grep "$zsh_path" /etc/shells` ]; then
  echo "Path to Zsh: $zsh_path. Enter your password to change default shell:"
  grep -Fxq "$zsh_path" /etc/shells || sudo bash -c "echo $zsh_path >> /etc/shells"
  chsh -s "$zsh_path" $USER || echo "Cannot set zsh as default shell!"
fi

# Installing oh-my-zsh
[ -d ~/.oh-my-zsh ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Installing oh-my-zsh plugins
zsh_custom_plugins=~/.oh-my-zsh/custom/plugins

if [ ! -d "$zsh_custom_plugins/min" ]; then
  git clone https://github.com/andrepolischuk/min $zsh_custom_plugins/min
  git clone https://github.com/zsh-users/zsh-autosuggestions $zsh_custom_plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $zsh_custom_plugins/zsh-syntax-highlighting
fi

# Installing vundle
[ -d ~/.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Make symlinks
ln -fs $DOTFILES/.aliases   $HOME/.aliases
ln -fs $DOTFILES/.exports   $HOME/.exports
ln -fs $DOTFILES/.gitconfig $HOME/.gitconfig
ln -fs $DOTFILES/.vimrc     $HOME/.vimrc
ln -fs $DOTFILES/.zshrc     $HOME/.zshrc
ln -fs $DOTFILES/.hyper.js  $HOME/.hyper.js

echo "Dotfiles installed successfully! Please restart your terminal!"