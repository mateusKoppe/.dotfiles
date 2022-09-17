echo "Installing Neovim..."
sudo pacman -Sq neovim repgrip --noconfirm
echo "Installing fonts"
sudo pacman -S ttf-jetbrains-mono
echo "Installing Packer..."
git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim -u ~/.config/nvim/init.lua +PackerInstall
