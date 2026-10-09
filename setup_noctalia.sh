#!/bin/bash

# Noctalia v5 (native binary, replaces the old quickshell-based noctalia-shell)
yay -S noctalia-git power-profiles-daemon brightnessctl imagemagick

sudo pacman -S wlsunset cliphist evolution-data-server

# Symlink the git-tracked config into place so Noctalia reads from this repo
ln -sfn ~/.config/hyp-env/noctalia ~/.config/noctalia

# Sound theme (freedesktop spec, picked in Settings -> Audio -> Sound theme)
mkdir -p ~/.local/share/sounds
ln -sfn ~/.config/hyp-env/sounds/dream ~/.local/share/sounds/dream
