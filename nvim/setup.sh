echo "Installing Neovim and dependencies..."


if [[ ! -z $(which apt-get) ]]; then
  sudo apt-get -y install neovim fzf ripgrep
elif [[ ! -z $(which pacman) ]]; then

  sudo pacman -Sq neovim fzf ripgrep --noconfirm
else
  echo "Package manager not found"
fi

stow nvim

echo "Done"

