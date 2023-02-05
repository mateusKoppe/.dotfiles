#!/bin/bash
#
WALLPAPER=`cat .config/nitrogen/bg-saved.cfg | grep -m 1 file | cut -d "=" -f 2`

convert -resize 1920x1080 $WALLPAPER RGB:- | i3lock -t -i /dev/stdin --raw=1920x1080:rgb --no-fork
