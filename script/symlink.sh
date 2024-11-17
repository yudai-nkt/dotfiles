#!/bin/bash

# Load useful stuff
source ${DOTDIR}/script/lib/util.sh

dotfiles=$(make list | sed '1d')

for file in ${dotfiles}; do
  ln -sfnv ${DOTDIR}/${file} ${HOME}/${file}
done

if is_macos; then
  ln -sfnv ${DOTDIR}/vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
fi
