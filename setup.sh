#!/bin/bash

HOME=${HOME}
PWD=`pwd`
DIR="$(dirname $(readlink -f $0))"

install_softwares(){
  echo "Updating..."
  sudo pacman Syu -q --noconfirm
}

install_zsh(){
  printf "\n"
  echo -n "Setup ZSH? [y/N] "
  read answer
  echo $answer
  if [ "$answer" != "${answer#[yY]}" ]; then
    ./scripts/setup-zsh.sh;
  fi
}

install_i3(){
  printf "\n"
  echo -n "Setup I3? [y/N] "
  read answer
  echo $answer
  if [ "$answer" != "${answer#[yY]}" ]; then
    ./scripts/setup-i3.sh;
  fi
}

install_neovim(){
  printf "\n"
  echo -n "Setup Neovim? [y/N] "
  read answer
  echo $answer
  if [ "$answer" != "${answer#[yY]}" ]; then
    ./scripts/setup-neovim.sh;
  fi
}

install_yay(){
  printf "\n"
  echo -n "Install yay? [y/N] "
  read answer
  echo $answer
  if [ "$answer" != "${answer#[yY]}" ]; then
    sudo pacman -S --needed git base-devel
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd $PWD
  fi
}

install_fonts(){
  printf "\n"
  echo -n "Install icon fonts? [y/N] "
  read answer
  echo $answer
  if [ "$answer" != "${answer#[yY]}" ]; then
    sudo pacman -S nerd-fonts
  fi
}



install_softwares
install_yay
install_fonts
install_zsh
install_neovim
