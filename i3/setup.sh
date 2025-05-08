#!/bin/bash
source ./utils.sh

echo "Installing I3"

## TODO: Check this on arch
install i3 pulseaudio-utils scrot

stow i3

echo "Done"
