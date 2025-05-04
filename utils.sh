#!/bin/bash
DISTRO=`grep "^ID=" /etc/os-release | awk -F "=" '{print $2}'`
PWD=`pwd`
FALSE=1
TRUE=0

PACMAN_INSTALL="sudo pacman --needed --noconfirm --quiet -S"
FLATPAK_INSTALL="flatpak install --noninteractive"

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
