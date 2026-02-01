#!/bin/bash

sudo pacman -S waybar bluetui impala btop

mkdir -p ~/.config/waybar

ln -sf ~/.config/hyp-env/waybar ~/.config/
