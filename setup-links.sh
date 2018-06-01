#!/bin/bash

HOME=${HOME}
PWD=`pwd`
DOTFILES_PATH="$(dirname $(readlink -f $0))"
SYMLINKS=( ".vimrc" ".zshrc" ".tmux.conf" )

create_symlinks(){
  for symlink in ${SYMLINKS[@]}
  do
    echo "Creating symlink for ${HOME}/${symlink}"
    rm ${HOME}/${symlink}
    ln -s ${DOTFILES_PATH}/${symlink} ${HOME}/${symlink}
  done
}

create_symlinks
