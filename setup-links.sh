#!/bin/bash

HOME=${HOME}
PWD=`pwd`
DOTFILES_PATH="$(dirname $(readlink -f $0))"
SYMLINKS=( ".zshrc" ".tmux.conf" ".vimrc" )

create_symlinks(){
  ln -s ${DOTFILES_PATH}/.zshrc ${HOME}/.zshrc
  ln -s ${DOTFILES_PATH}/.tmux.conf ${HOME}/.tmux.conf
  ln -s ${DOTFILES_PATH}/.vimrc ${HOME}/.config/nvim/init.vim
}

create_symlinks
