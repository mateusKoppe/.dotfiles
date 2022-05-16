install_yay(){
    sudo pacman -S --needed git base-devel
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd $PWD
}


intall_grub_theme(){
    printf "\n"
    echo -n "Do you wish to install zsh with its configurations? [y/N] "
    read answer
    echo $answer
    if [ "$answer" != "${answer#[yY]}" ]; then
        sudo pacman -S grub-theme-vimix
    fi
}

install_fonts(){
    sudo pacman -S nerd-fonts
}

