#!/bin/bash

HOME=${HOME}
PWD=`pwd`
DOTFILES_PATH="$(dirname $(readlink -f $0))"

remove_symlinks(){
  rm -fr ${HOME}/.fonts
  rm -f ${HOME}/.zshrc
  rm -f ${HOME}/.tmux.conf
  rm -f ${HOME}/.config/deadd
  rm -f ${HOME}/.p10k.zsh
  rm -f ${HOME}/.config/i3 -r
  rm -f ${HOME}/.config/polybar -r
  rm -fr ${HOME}/.config/rofi
  rm -fr ${HOME}/.config/picom
  rm -fr ${HOME}/.config/kitty
}

create_symlinks(){
  ln -s ${DOTFILES_PATH}/fonts ${HOME}/.fonts
  ln -s ${DOTFILES_PATH}/zsh/.zshrc ${HOME}/.zshrc
  ln -s ${DOTFILES_PATH}/deadd ${HOME}/.config/deadd
  ln -s ${DOTFILES_PATH}/.tmux.conf ${HOME}/.tmux.conf
  ln -s ${DOTFILES_PATH}/zsh/.p10k.zsh ${HOME}/.p10k.zsh
  ln -s ${DOTFILES_PATH}/i3 ${HOME}/.config/i3
  ln -s ${DOTFILES_PATH}/polybar ${HOME}/.config/polybar
  ln -s ${DOTFILES_PATH}/rofi ${HOME}/.config/rofi
  ln -s ${DOTFILES_PATH}/picom ${HOME}/.config/picom
  ln -s ${DOTFILES_PATH}/kitty ${HOME}/.config/kitty
}

remove_symlinks
create_symlinks
