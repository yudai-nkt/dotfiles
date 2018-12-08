#!/bin/bash

# Load useful stuff
source ${DOTDIR}/script/lib/util.sh

# Install Xcode Command Line Tools
# xcode-select --install

# Install Homebrew
if is_available /usr/local/bin/brew; then
  echo "Homebrew is already installed."
  exit
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if is_available /usr/local/bin/brew; then
  /usr/local/bin/brew doctor
else
  echo "Homebrew installation failed."
  exit 1
fi

# Install Homebrew formulae
/usr/local/bin/brew bundle --file=${DOTDIR}/script/misc/Brewfile

# Change login shell to Homebrewed Zsh
sudo echo "$(/usr/local/bin/brew --prefix)/bin/zsh" >> /etc/shells
chsh -s "$(/usr/local/bin/brew --prefix)/bin/zsh"
