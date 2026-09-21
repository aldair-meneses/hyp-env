#!/bin/sh
case "$1" in
  post)
    bluetoothctl power off
    bluetoothctl power on
    ;;
esac
