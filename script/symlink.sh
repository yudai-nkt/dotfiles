#!/bin/bash

# Load useful stuff
source ${DOTDIR}/script/lib/util.sh

dotfiles=$(make list | sed '1d')

for file in ${dotfiles}; do
  # If a dotfile is in a subdirectory and the corresponding subdirectory
  # does not exit in the home directory, create it.
  if ! is_inroot $file; then
    mkdir -p ${HOME}/${file%/*}
  fi
  ln -sfnv ${DOTDIR}/${file} ${HOME}/${file}
done
