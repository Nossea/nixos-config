#!/usr/bin/env bash

current_datetime=$(date +"%Y-%m-%d %H:%M:%S")
previousVersion=$(git rev-list --count --all)
trueVersion=$((previousVersion + 1))

set -e

source ./selected-config.txt

cd ./

git reset

git add --all

git diff -U0 *.nix

sudo echo "

Nixos rebuilding..."

sudo nixos-rebuild switch --option eval-cache false --flake $CONFIG &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

echo "Nixos successfully rebuilt!"

# find ./hosts/* -type d -exec git reset -- ./hardware-configuration.nix {} \;
git reset -- ./nixos-switch.log

git commit -am "Version ${trueVersion}: $current_datetime"

git push --force

echo "

NixOS Rebuilt OK! 
Version ${trueVersion} Active!"

notify-send -e "NixOS Rebuilt OK!"  "Version ${trueVersion} Active!"

echo "

Cleaning System...

"

sudo nix-collect-garbage -d --delete-older-than 15d