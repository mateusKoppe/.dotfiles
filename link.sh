#!/bin/bash

HOME=${HOME}
PWD=`pwd`
DOTFILES_PATH="$(dirname $(readlink -f $0))"

remove_symlinks(){
  rm -f ${HOME}/.zshrc
  rm -f ${HOME}/.tmux.conf
  rm -f ${HOME}/.config/nvim/init.vim
  rm -f ${HOME}/.p10k.zsh
  rm -f ${HOME}/.config/i3 -rf
  rm -f ${HOME}/.config/polybar -rf
}

create_symlinks(){
  ln -s ${DOTFILES_PATH}/zsh/.zshrc ${HOME}/.zshrc
  ln -s ${DOTFILES_PATH}/.tmux.conf ${HOME}/.tmux.conf
  ln -s ${DOTFILES_PATH}/.p10k.zsh ${HOME}/.p10k.zsh
  mkdir -p ${HOME}/.config/nvim
  ln -s ${DOTFILES_PATH}/nvim/init.vim ${HOME}/.config/nvim/init.vim
  ln -s ${DOTFILES_PATH}/i3 ${HOME}/.config/i3
  ln -s ${DOTFILES_PATH}/polybar ${HOME}/.config/polybar
  ln -s ${DOTFILES_PATH}/rofi ${HOME}/.config/rofi
}

remove_symlinks
create_symlinks
