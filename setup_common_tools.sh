#!/bin/bash

sudo pacman -S alacritty bluez bluez-utils libnotify mako alsa-utils \
    alsa-card-profiles os-prober ripgrep fzf eza keepassxc thunar \
    thunar-archive-plugin thunar-volman thunar-media-tags-plugin gvfs tumbler \
    ffmpegthumbnailer libgtop dart-sass upower gtksourceview3 libsoup3 \
    xdg-desktop-portal

sudo systemctl enable bluetooth

yay -S flameshot-git

ln -sf ~/.config/hyp-env/mako ~/.config/
