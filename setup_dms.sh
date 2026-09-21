#!/bin/bash
set -euo pipefail

# DankMaterialShell 1.6 ("Marble Tabby"), replacing Noctalia as the sway shell.
# Safe to re-run. Pairs with the sway/conf.d changes on this branch.

echo "==> Installing DankMaterialShell and its optional integrations"
sudo pacman -S --needed --noconfirm \
    dms-shell \
    cava \
    matugen \
    qt6-multimedia \
    qt6ct \
    wtype \
    i2c-tools \
    power-profiles-daemon \
    networkmanager \
    cliphist \
    wl-clipboard \
    brightnessctl \
    dgop

echo "==> Installing dsearch (file search backend, AUR)"
yay -S --needed --noconfirm dsearch-bin

echo "==> Retiring Noctalia"
if pacman -Qq noctalia-git >/dev/null 2>&1; then
    yay -Rns --noconfirm noctalia-git
fi

# setup_noctalia.sh symlinked this into the repo. Only the link goes; the live
# settings under ~/.local/state/noctalia stay put in case you want to roll back.
if [ -L "$HOME/.config/noctalia" ]; then
    rm "$HOME/.config/noctalia"
fi

echo "==> Handing the current session over to DMS"
if [ -n "${SWAYSOCK:-}" ]; then
    pkill -x noctalia || true
    swaymsg reload
    dms run -d
    echo "    DMS is running. Bar, notifications and tray are now its job."
else
    echo "    Not inside a sway session, skipped. It starts on your next login."
fi

cat <<'MSG'

Done. Keybindings on this branch:
  Super+Space      launcher (spotlight)
  Super+S          control center
  Super+N          notifications
  Super+Comma      settings
  Super+Escape     power menu
  Super+Shift+L    clipboard history
  Super+L          lock

Settings live in ~/.config/DankMaterialShell, which this repo does not track yet.
Configure the shell the way you want it, then decide what is worth committing.
MSG
