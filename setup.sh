#!/bin/bash
source utils.sh

install_softwares(){
  echo "Updating and installing essential packages..."
  update
  install git flatpak curl stow 

  if $UBUNTU; then
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  fi

  if $ARCH; then
    ## Install Yay if not installed
    if ! [ -x "$(command -v yay)" ]; then
      cd /tmp
      git clone https://aur.archlinux.org/yay.git
      cd yay
      makepkg -si
      cd $PWD
    fi
  fi
}

install_grub_theme(){
  install os-prober

  THEME_INSTALLED=`grep -c "GRUB_THEME.*tela" /etc/default/grub`
  if [ $THEME_INSTALLED == 0 ]; then
    cd /tmp
    git clone https://github.com/vinceliuice/grub2-themes
    cd grub2-themes
    sudo ./install.sh -b -t tela -s 1080p
    sudo sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/g' /etc/default/grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    cd $PWD
  fi
}

install_cli_tools(){
  install tldr jq awk

  if $UBUNTU; then
    ## TODO: Install cargo
    ## TODO: Check if --locked is necessary
    cargo install --locked yazi-fm yazi-cli
  fi

  if $ARCH; then
    $PACMAN_INSTALL yazi
  fi
}

install_dev_tools(){
  install docker docker-compose

  # Node Version Manager
  if ! [ -s "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  fi
}

install_gui(){
  $FLATPAK_INSTALL --noninteractive com.spotify.Client
}

install_work(){
  if confirm "Install work stuff?"; then
    $FLATPAK_INSTALL com.slack.Slack com.microsoft.Teams com.getpostman.Postman
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
