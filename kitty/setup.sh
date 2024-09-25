echo "Installing Kitty and dependencies..."


if [[ ! -z $(which apt-get) ]]; then
  echo "Apt not configured";
elif [[ ! -z $(which pacman) ]]; then
  sudo pacman -Sq stow kitty ttf-jetbrains-mono ttf-nerd-fonts-symbols --noconfirm
else
  echo "Package manager not found"
fi

stow kitty

echo "Done"

