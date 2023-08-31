# echo "Installing Tmux"
# sudo pacman -Sq tmux
echo "Installing TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

stow tmux

