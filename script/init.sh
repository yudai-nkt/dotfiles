#!/bin/bash

# Load useful stuff
source ${DOTDIR}/script/lib/util.sh

# Install Xcode Command Line Tools
# xcode-select --install

# Install Homebrew
if is_available brew; then
  echo "Homebrew is already installed."
  exit
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if is_available brew; then
  brew doctor
else
  echo "Homebrew installation failed."
  exit 1
fi

# Install Homebrew formulae
brew bundle --file ${DOTDIR}/script/misc/Brewfile

# Change login shell to Homebrewed Zsh
sudo echo "$(brew --prefix)/bin/zsh" >> /etc/shells
chsh -s "$(brew --prefix)/bin/zsh"
