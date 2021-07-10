#!/bin/bash

HOME=${HOME}
PWD=`pwd`
DIR="$(dirname $(readlink -f $0))"

install_softwares(){
  echo "Updating..."
  sudo pacman Syu -q --noconfirm
  sudo pacman -Sq git exa bat --noconfirm
}

install_zsh(){
  printf "\n"
  echo -n "Do you wish to install zsh with its configurations? [y/N] "
  read answer
  echo $answer
  if [ "$answer" != "${answer#[yY]}" ]; then
    ./zsh/install.sh;
  fi
}

install_i3(){
  printf "\n"
  echo -n "Do you wish to install i3 with its configurations? [y/N] "
  read answer
  echo $answer
  if [ "$answer" != "${answer#[yY]}" ]; then
    ./i3/install.sh;
  fi
}

install_neovim(){
  printf "\n"
  echo -n "Do you wish to use neovim with its configurations? [y/N] "
  read answer
  echo $answer
  if [ "$answer" != "${answer#[yY]}" ]; then
    ./nvim/install.sh;
  fi
}

install_softwares
install_neovim
install_i3
install_zsh
