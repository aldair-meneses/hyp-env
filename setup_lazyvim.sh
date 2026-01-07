#!/bin/bash

sudo pacman -S nvim ttf-firacode-nerd lazygit curl fzf ripgrep fd gcc tree-sitter-cli

git clone https://github.com/LazyVim/starter ~/.config/nvim

wget https://luarocks.org/releases/luarocks-3.13.0.tar.gz
tar zxpf luarocks-3.13.0.tar.gz
cd luarocks-3.13.0

./configure && make && sudo make install

sudo luarocks install luasocket

cd ..
rm -rf luarocks*
rm -rf ~/.config/nvim/.git
