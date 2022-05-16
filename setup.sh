#!/bin/bash

PWD=`pwd`

source scripts/utils.sh

install_softwares(){
  echo "Updating..."
  sudo pacman Syu -q --noconfirm
  sudo pacman -S --needed git base-devel -q --noconfirm
}

install_zsh(){
  if confirm "Setup ZSH?"; then
    ./scripts/setup-zsh.sh;
  fi
}

install_neovim(){
  if confirm "Setup Neovim?"; then
    ./scripts/setup-neovim.sh;
  fi
}

install_yay(){
  if confirm "Install yay?"; then
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd $PWD
  fi
}

install_fonts(){
  if confirm "Install icon fonts?"; then
    sudo pacman -S nerd-fonts
  fi
}

install_grub_theme(){
  if confirm "Install grub theme (Vimix)?"; then
    cd /tmp
    git clone https://github.com/vinceliuice/grub2-themes
    cd grub2-themes
    sudo ./install.sh -b -t tela -s 1080p
    cd $PWD
  fi
}

install_softwares
install_yay
install_fonts
install_zsh
install_neovim
install_grub_theme