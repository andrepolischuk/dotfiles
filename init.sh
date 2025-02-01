#!/usr/bin/env bash

# Update dotfiles
git pull origin master

# Registers bash as a default shell
bash_path=$(which bash)

if [ -z `grep "$bash_path" /etc/shells` ]; then
  echo "Path to bash: $bash_path. Enter your password to change default shell:"
  grep -Fxq "$bash_path" /etc/shells || sudo bash -c "echo $bash_path >> /etc/shells"
  chsh -s "$bash_path" $USER || echo "Cannot set bash as default shell!"
fi

# Link configs
ln -fs $PWD/.aliases          $HOME/.aliases
ln -fs $PWD/.bash_profile     $HOME/.bash_profile
ln -fs $PWD/.bashrc           $HOME/.bashrc
ln -fs $PWD/.gitconfig        $HOME/.gitconfig
ln -fs $PWD/.vimrc            $HOME/.vimrc

# Link vim
mkdir -p $HOME/.vim
ln -fs $PWD/coc-settings.json $HOME/.vim/coc-settings.json

# Link gpg
mkdir -p $HOME/.gnupg
ln -fs $PWD/gpg.conf          $HOME/.gnupg/gpg.conf
ln -fs $PWD/gpg-agent.conf    $HOME/.gnupg/gpg-agent.conf

echo "Dotfiles installed successfully! Please restart your terminal!"
