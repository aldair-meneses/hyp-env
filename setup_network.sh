#!/bin/bash

sudo pacman -Syu --noconfirm iwd systemd-networkd systemd-resolved

sudo systemctl enable --now iwd
sudo systemctl enable --now systemd-networkd
sudo systemctl enable --now systemd-resolved

sudo tee /etc/systemd/network/25-wlan.network > /dev/null <<EOF
[Match]
Name=wlan0

[Network]
DHCP=yes
EOF

sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

sudo systemctl restart systemd-networkd
sudo systemctl restart iwd

echo "Status da interface:"
networkctl status wlan0
echo "Status do DNS:"
resolvectl status

