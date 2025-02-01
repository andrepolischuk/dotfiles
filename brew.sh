#!/usr/bin/env bash

# Install brew
if [ -z `which brew` ]; then
  echo "foo"
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update brew to latest version
brew update

# Install tools
brew install \
  colima \
  docker \
  docker-compose \
  git \
  gnupg \
  n \
  nginx \
  openconnect \
  pinentry-mac \
  the_silver_searcher \
  vim \
  yarn

# Remove outdated versions
brew cleanup
