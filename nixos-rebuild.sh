#!/usr/bin/env bash

current_datetime=$(date +"%Y-%m-%d %H:%M:%S")

set -e

cd /home/nossea/nixos-config/

git reset

git add *

git diff -U0 *.nix

echo "Nixos rebuilding..."
sudo nixos-rebuild switch --flake /home/nossea/nixos-config#default &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

git reset -- nixos-switch.log

git commit -am "$current_datetime"

git push

Version=$(git rev-list --count --all)

notify-send -e "NixOS Rebuilt OK! Version ${Version} Active!" --icon=software-update-available