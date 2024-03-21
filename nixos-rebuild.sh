#!/usr/bin/env bash

current_datetime=$(date +"%Y-%m-%d %H:%M:%S")
previousVersion=$(git rev-list --count --all)
trueVersion=$((previousVersion + 1))

set -e

cd /home/${USER}/nixos-config/

git reset

git add *

git diff -U0 *.nix

sudo echo "Nixos rebuilding..."

sudo nixos-rebuild switch --flake /home/${USER}/nixos-config#default &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

echo "Nixos successfully rebuilt!"

git reset -- nixos-switch.log

git commit -am "Version ${trueVersion}: $current_datetime"

git push

echo "

NixOS Rebuilt OK! 
Version ${trueVersion} Active!"

notify-send -e "NixOS Rebuilt OK!"  "Version ${trueVersion} Active!"