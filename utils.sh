#!/bin/bash
PWD=`pwd`
FALSE=1
TRUE=0

PACMAN_INSTALL="sudo pacman --needed --noconfirm --quiet -S"
FLATPAK_INSTALL="flatpak install --noninteractive"
APT_INSTALL="sudo apt install --yes"

# OS ID
DISTRO=`grep "^ID=" /etc/os-release | awk -F "=" '{print $2}'`
ARCH=false
UBUNTU=false
case $DISTRO in
  ubuntu)
    UBUNTU=true
  ;;

  arch)
    ARCH=true
  ;;

  *)
    echo "This is an unknown distribution."
  ;;
esac

confirm () {
  printf "\n"

  DEFAULT=$FALSE
  DEFAULT_PRINT="[y/N]"
  if [ "$2" = "y" ]; then
    DEFAULT=$TRUE
    DEFAULT_PRINT="[Y/n]"
  fi

  read -p "${1:-"Confirm?"} $DEFAULT_PRINT: " ANSWER

  case $ANSWER in
    [yY]) true;;
    [nN]) false;;
    *) return $DEFAULT;;
  esac
}



install() {
  if $UBUNTU; then
    $APT_INSTALL $@
  fi

  if $ARCH; then
    $PACMAN_INSTALL $@
  fi
}

update() {
  if $UBUNTU; then
    sudo apt update --yes
    sudo apt upgrade --yes
    sudo apt autoremove --yes
  fi

  if $ARCH; then
    sudo pacman --noconfirm --quiet -Syu
  fi
}
