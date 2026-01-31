#!/bin/bash

sudo pacman -S nvim ttf-firacode-nerd lazygit curl fzf ripgrep fd gcc tree-sitter-cli

# required
rm -rf ~/.config/nvim

# optional but recommended
rm -rf ~/.local/share/nvim{,.bak}
rm -rf ~/.local/state/nvim{,.bak}
rm -rf ~/.cache/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim

wget https://luarocks.org/releases/luarocks-3.13.0.tar.gz
tar zxpf luarocks-3.13.0.tar.gz
cd luarocks-3.13.0

./configure && make && sudo make install

sudo luarocks install luasocket
sudo ln -sf /usr/bin/nvim /usr/bin/vim
cd ..
rm -rf luarocks*
rm -rf ~/.config/nvim/.git
