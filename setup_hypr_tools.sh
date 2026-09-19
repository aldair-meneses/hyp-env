#!/bin/bash

./setup_common_tools.sh

sudo pacman -S hyprpaper xdg-desktop-portal-hyprland hyprpicker \
    hyprland-guiutils hyprpolkitagent hyprland-qt-support hyprlock

ln -sf ~/.config/hyp-env/hypr ~/.config/

systemctl --user stop xdg-desktop-portal
systemctl --user stop xdg-desktop-portal-hyprland

systemctl --user start xdg-desktop-portal-hyprland
systemctl --user start xdg-desktop-portal
