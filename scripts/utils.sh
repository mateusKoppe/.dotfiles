#!/bin/bash

FALSE=1
TRUE=0

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