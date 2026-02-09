#!/bin/bash

sudo pacman -Syu --noconfirm networkmanager

sudo systemctl enable --now NetworkManager

yay -S gazelle --noconfirm --answerdiff None --answerclean None

sudo tee /etc/systemd/network/25-wlan.network >/dev/null <<EOF
[Match]
Name=wlan0

[Network]
DHCP=yes
EOF
