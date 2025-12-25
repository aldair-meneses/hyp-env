#!/bin/bash

sudo pacman -S waybar bluetui imapala

mkdir -p ~/.config/waybar

ln -sf ~/.config/hyp-env/waybar ~/.config/
