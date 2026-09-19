#!/bin/bash

./setup_common_tools.sh

sudo pacman -S sway swaybg xdg-desktop-portal-wlr

yay -S libinput-gestures

ln -sf ~/.config/hyp-env/sway ~/.config/
ln -sf ~/.config/hyp-env/libinput-gestures/config ~/.config/libinput-gestures.conf

mkdir -p ~/.config/uwsm
ln -sf ~/.config/hyp-env/sway/uwsm-env-sway ~/.config/uwsm/env-sway

libinput-gestures-setup autostart

if [ ! -f /usr/local/share/wayland-sessions/sway-uwsm.desktop ]; then
    sudo mkdir -p /usr/local/share/wayland-sessions
    sudo tee /usr/local/share/wayland-sessions/sway-uwsm.desktop > /dev/null <<'EOF'
[Desktop Entry]
Name=Sway (uwsm-managed)
Comment=An i3-compatible tiling Wayland compositor
Exec=uwsm start -e -D sway sway.desktop
TryExec=uwsm
DesktopNames=sway
Type=Application
EOF
fi

systemctl --user stop xdg-desktop-portal
systemctl --user stop xdg-desktop-portal-wlr

systemctl --user start xdg-desktop-portal-wlr
systemctl --user start xdg-desktop-portal
