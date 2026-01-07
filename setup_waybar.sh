#!/bin/bash

sudo pacman -S waybar bluetui impala

mkdir -p ~/.config/waybar

ln -sf ~/.config/hyp-env/waybar ~/.config/
