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

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if is_available brew; then
  brew doctor
else
  abort "Homebrew installation failed."
fi

# Install Homebrew formulae
brew bundle --file=${DOTDIR}/script/misc/Brewfile

defaults write com.apple.dock autohide -bool true
defaults write com.apple.screencapture disable-shadow -bool true
mkdir -p ${HOME}/Pictures/screenshots && defaults write com.apple.screencapture location ${HOME}/Pictures/screenshots

# Show English directory names in Finder
for dir in Desktop Documents Downloads Movies Music Pictures Public; do
  rm "${HOME}/${dir}/.localized"
done
sudo rm /Applications/.localized

# Change login shell to Homebrewed Zsh
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
chsh -s "$(brew --prefix)/bin/zsh"
