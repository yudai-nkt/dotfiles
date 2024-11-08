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
  abort "Homebrew installation failed."
fi

# Install Homebrew formulae
brew bundle --file=${DOTDIR}/script/misc/Brewfile

# Install Python 3 packages
if is_available pip3; then
  pip3 install --requirement ${DOTDIR}/script/misc/requirements.txt
else
  abort "Python 3 (and pip3) installation failed"
fi

# Install TeX Live
curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xz
cd install-tl-20*
sudo ./install-tl --profile ${DOTDIR}/script/misc/texlive.profile
sudo /usr/local/texlive/*/bin/x86_64-darwin/tlmgr path add
cd ../
rm -rf install-tl-20*

# Show English directory names in Finder
for dir in Desktop Documents Downloads Movies Music Pictures Public; do
  rm "${HOME}/${dir}/.localized"
done
sudo rm /Applications/.localized

# Change login shell to Homebrewed Zsh
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
chsh -s "$(brew --prefix)/bin/zsh"
