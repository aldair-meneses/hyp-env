#!/bin/bash
set -euo pipefail

PATCH_FILE="/home/aldrick/.config/hyp-env/patches/0001-bar-add-configurable-middle-and-right-click-actions-.patch"
BUILD_DIR="/tmp/dms-repatch-build"
INSTALL_TARGET="/usr/bin/dms"

log() { echo "[dms-repatch] $*"; }

if ! command -v go &>/dev/null; then
    log "Go toolchain not found, skipping repatch."
    exit 0
fi

if [ ! -f "$PATCH_FILE" ]; then
    log "Patch file not found: $PATCH_FILE"
    exit 1
fi

INSTALLED_VERSION=$(pacman -Q dms-shell 2>/dev/null | awk '{print $2}' | sed 's/-[0-9]*$//')
if [ -z "$INSTALLED_VERSION" ]; then
    log "dms-shell package not installed, skipping."
    exit 0
fi

log "Installed dms-shell version: $INSTALLED_VERSION"

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

log "Cloning DankMaterialShell source..."
git clone --recurse-submodules https://github.com/AvengeMedia/DankMaterialShell.git "$BUILD_DIR"

cd "$BUILD_DIR"

log "Applying patch..."
git apply "$PATCH_FILE"

log "Building dms..."
make build VERSION="${INSTALLED_VERSION}+patch" --quiet

if [ ! -f "core/bin/dms" ]; then
    log "Build failed: core/bin/dms not found."
    exit 1
fi

log "Installing to $INSTALL_TARGET..."
sudo install -Dm755 core/bin/dms "$INSTALL_TARGET"

log "Done. DMS repatched and reinstalled."
