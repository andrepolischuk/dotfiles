#!/usr/bin/env bash

# Kill node processes
killall node || true

# Remove brew artifacts
command -v brew >/dev/null 2>&1 && {
  brew cleanup
  brew cask cleanup
  brew prune
}

# Remove ubuntu artifacts
command -v apt-get >/dev/null 2>&1 && {
  sudo apt-get autoremove -y
  sudo apt-get autoclean -y
}

# Remove .DS_Store files
find $HOME -name '.DS_Store' -delete

# Remove downloads
rm -rf $HOME/Downloads/*

echo "Cleaning completed successfully!"
