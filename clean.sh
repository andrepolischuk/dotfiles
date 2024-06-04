#!/usr/bin/env bash

# Kill node processes
killall node || true

# Remove brew artifacts
command -v brew >/dev/null 2>&1 && {
  brew cleanup
}

# Remove ubuntu artifacts
command -v apt-get >/dev/null 2>&1 && {
  sudo apt-get autoremove -y
  sudo apt-get autoclean -y
}

# Remove yarn artifacts
command -v yarn >/dev/null 2>&1 && {
  yarn cache clean
}

# Remove npm artifacts
command -v npm >/dev/null 2>&1 && {
  sudo npm cache clean -f
}

# Remove node modules
find $HOME/Git -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;

# Remove downloads and caches
rm -rf $HOME/Downloads/*
rm -rf $HOME/Library/Caches/*
sudo rm -rf /var/log/*

echo "Cleaning completed successfully!"
