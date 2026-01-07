#!/bin/bash

sudo pacman -S kitty bluez hyprpaper xdg-desktop-portal-hyprland hyprpicker hyprland-guiutils hyprpolkitagent hyprland-qt-support libnotify mako

yay -S flameshot-git

ln -sf ~/.config/hyp-env/hypr ~/.config/
ln -sf ~/.config/hyp-env/mako ~/.config/

systemctl --user stop xdg-desktop-portal
systemctl --user stop xdg-desktop-portal-hyprland

systemctl --user start xdg-desktop-portal-hyprland
systemctl --user start xdg-desktop-portal
