#!/bin/bash

HOME=${HOME}
PWD=`pwd`
DIR="$(dirname $(readlink -f $0))"

rm -f ${HOME}/.zshrc
ln -s ${DIR}/zsh/.zshrc ${HOME}/.zshrc

echo "Installing zsh..."
sudo pacman -Sq zsh --noconfirm
echo "Installing Ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
