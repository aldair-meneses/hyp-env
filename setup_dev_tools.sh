# PHP
sudo pacman -S php-{fpm,redis,sqlite}
sudo systemctl enable --now php-fpm.service

# Node

# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

bash -i -c "source ~/.bashrc; nvm install node"

# Git

sudo pacman -S lazygit
