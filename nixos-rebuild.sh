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

Version=$(git rev-list --count --all)

git commit -am " ${Version+1}: $current_datetime"

git push

notify-send -e "NixOS Rebuilt OK! Version ${Version+1} Active!" --icon=software-update-available