#!/bin/bash

sudo pacman -S ttf-firacode-nerd ttf-fira-code ttf-fira-sans

curl -L -O https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip && sudo unzip -d /usr/share/fonts/TTF/ NerdFontsSymbolsOnly.zip

sudo fc-cache -fv

rm -rf NerdFontsSymbolsOnly.zip
