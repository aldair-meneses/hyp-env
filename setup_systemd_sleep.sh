#!/bin/bash

sudo mkdir -p /etc/systemd/system-sleep

sudo ln -sf ~/.config/hyp-env/systemd-sleep/bt-fast-reconnect.sh /etc/systemd/system-sleep/bt-fast-reconnect.sh
sudo chmod 755 ~/.config/hyp-env/systemd-sleep/bt-fast-reconnect.sh
