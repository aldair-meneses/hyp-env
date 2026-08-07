#!/bin/bash

# Espanso has to be built from source for Wayland. The prebuilt packages ship
# the X11 backend, which never sees keystrokes under Hyprland.

sudo pacman -S --needed git dbus base-devel wl-clipboard wxwidgets-gtk3 \
    libxkbcommon python

# Rust toolchain, required by the build (skips itself if rustup is already installed)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

git clone https://github.com/espanso/espanso /tmp/espanso-build
cd /tmp/espanso-build

cargo build -p espanso --release --no-default-features --features modulo,vendored-tls,wayland

sudo mv target/release/espanso /usr/local/bin/espanso

cd ..
rm -rf /tmp/espanso-build

# The Wayland backend reads keystrokes straight from /dev/input
sudo setcap "cap_dac_override+p" $(which espanso)
sudo usermod -aG input $USER

# Symlink the git-tracked config into place so espanso reads from this repo
ln -sfn ~/.config/hyp-env/espanso ~/.config/espanso

espanso service register
espanso start
