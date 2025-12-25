#!/bin/bash

yay -S walker elephant elephant-{archlinuxpkgs,bluetooth,calc,clipboard,files,menus,providerlist,windows}

mkdir ~/.config/autostart/

ln -sf  ~/.config/hyp-env/walker/walker.desktop ~/.config/autostart/walker.desktop
ln -sf  ~/.config/hyp-env/walker/ ~/.config/
