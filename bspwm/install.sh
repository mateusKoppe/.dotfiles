#!/bin/bash
sudo pacman -S --noconfirm bspwm sxhkd picom feh polybar

HOME=${HOME}
DIR="$(dirname $(readlink -f $0))"

ln -s ${DIR}/bspwm ${HOME}/.config/bspwm
ln -s ${DIR}/sxhkd ${HOME}/.config/sxhkd
ln -s ${DIR}/polybar ${HOME}/.config/polybar
