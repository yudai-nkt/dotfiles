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

# Install atom, apm, and Atom packages after Atom.app is successfully installed
if [[ -d /Applications/Atom.app ]]; then
  # This is what the windows:install-shell-commands command does in Atom
  ATOM_RESOURCES_DIR='/Applications/Atom.app/Contents/Resources'
  ATOM_INSTALL_DIR='/usr/local/bin'
  ln -sfv ${ATOM_RESOURCES_DIR}/app/atom.sh ${ATOM_INSTALL_DIR}/atom
  ln -sfv ${ATOM_RESOURCES_DIR}/app/apm/node_modules/.bin/apm ${ATOM_INSTALL_DIR}/apm

  # Install community packages
  ${ATOM_INSTALL_DIR}/apm install --packages-file ${DOTDIR}/script/misc/atom-packages
fi

# Change login shell to Homebrewed Zsh
echo "$(/usr/local/bin/brew --prefix)/bin/zsh" | sudo tee -a /etc/shells
chsh -s "$(/usr/local/bin/brew --prefix)/bin/zsh"
