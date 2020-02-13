#!/bin/bash

HOME=${HOME}
PWD=`pwd`
DOTFILES_PATH="$(dirname $(readlink -f $0))"

remove_symlinks(){
  rm -f ${HOME}/.zshrc
  rm -f ${HOME}/.tmux.conf
  rm -f ${HOME}/.config/nvim/init.vim
  rm -f ${HOME}/.p10k.zsh
}

create_symlinks(){
  ln -s ${DOTFILES_PATH}/.zshrc ${HOME}/.zshrc
  ln -s ${DOTFILES_PATH}/.tmux.conf ${HOME}/.tmux.conf
  ln -s ${DOTFILES_PATH}/.p10k.zsh ${HOME}/.p10k.zsh
  mkdir -p ${HOME}/.config/nvim
  ln -s ${DOTFILES_PATH}/init.vim ${HOME}/.config/nvim/init.vim
}

remove_symlinks
create_symlinks
