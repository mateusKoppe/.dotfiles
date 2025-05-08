#!/bin/bash

echo "Replace escape with Capslock"
setxkbmap -option caps:swapescape

echo 'Section "InputClass"
        MatchIsKeyboard "on"
        Option "XkbOptions" "caps:escape"
EndSection' | sudo tee /etc/X11/xorg.conf.d/00-keyboard.conf > /dev/null
