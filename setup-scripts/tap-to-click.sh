echo "Setup tap to click"

echo 'Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
        Option "NaturalScrolling" "on"
EndSection' | sudo tee /etc/X11/xorg.conf.d/40-libinput.conf > /dev/null
