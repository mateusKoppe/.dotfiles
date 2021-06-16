#!/bin/bash

HOME=${HOME}
PWD=`pwd`
DIR="$(dirname $(readlink -f $0))"

rm -f ${HOME}/.config/i3 -r
rm -f ${HOME}/.config/polybar -r
rm -fr ${HOME}/.config/rofi
rm -fr ${HOME}/.config/picom
rm -fr ${HOME}/.config/deadd

ln -s ${DIR}/i3 ${HOME}/.config/i3
ln -s ${DIR}/polybar ${HOME}/.config/polybar
ln -s ${DIR}/rofi ${HOME}/.config/rofi
ln -s ${DIR}/picom ${HOME}/.config/picom
ln -s ${DIR}/deadd ${HOME}/.config/deadd

sudo pacman -Sq --noconfirm i3 rofi feh i3lock playerctl
yay -Sq --noconfirm polybar deadd-notification-center
