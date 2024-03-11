#!/usr/bin/env bash

current_datetime=$(date +"%Y-%m-%d %H:%M:%S")

set -e

cd /home/nossea/nixos-config/

git diff -U0 *.nix

echo "Nixos rebuilding..."
sudo nixos-rebuild switch --flake /home/nossea/nixos-config#default &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

git add *

git reset -- nixos-switch.log

git commit -am "$current_datetime"

git push

notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available