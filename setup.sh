#!/bin/bash
source utils.sh

install_softwares(){
  echo "Updating and installing essencial packages..."

  if $UBUNTU; then
    sudo apt update
    sudo apt upgrade
    sudo apt install flatpak git man
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  fi

  if $ARCH; then
    sudo pacman -Syu

    ## Install Yay if not installed
    if ! [ -x "$(command -v yay)" ]; then
      cd /tmp
      git clone https://aur.archlinux.org/yay.git
      cd yay
      makepkg -si
      cd $PWD
    fi

    sudo pacman -S git man flatpak
  fi
}

install_grub_theme(){
  if $UBUNTU; then
    sudo apt install os-prober
  fi

  if $ARCH; then
    sudo pacman -Sy os-prober --noconfirm
  fi

  cd /tmp
  git clone https://github.com/vinceliuice/grub2-themes
  cd grub2-themes
  sudo ./install.sh -b -t tela -s 1080p
  sudo sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/g' /etc/default/grub
  sudo grub-mkconfig -o /boot/grub/grub.cfg
  cd $PWD
}

install_cli_tools(){
  if $UBUNTU; then
    sudo apt install yazi tldr
  fi

  if $ARCH; then
    sudo pacman -Sy --noconfirm yazi tldr man
  fi
}

install_dev_tools(){
  if $UBUNTU; then
    sudo apt install docker docker-compose
  fi

  if $ARCH; then
    sudo pacman -Sy --noconfirm docker docker-compose
  fi

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
}

install_gui(){
  flatpak install com.spotify.Client
}

install_work(){
  if confirm "Install work stuff?"; then
    flatpak install com.slack.Slack com.microsoft.Teams com.getpostman.Postman
  fi
}

install_softwares
./kitty/setup.sh;
./nvim/setup.sh;
./zsh/setup.sh;
./awesome/setup.sh;

install_cli_tools
install_dev_tools
install_gui
install_work
install_grub_theme
