#!/usr/bin/env bash

set -e

echo "
!!CAREFUL!! This will overwrite ALL "hardware-configuration.nix" files within the hosts directory.
This is good if you are installing on a new system but bad if you edited them.
Are you sure you want to do this?
"

sudo nixos-generate-config --show-hardware-config > ./hardware-configuration.nix
find ./hosts/* -type d -exec cp ./hardware-configuration.nix {} \;
rm ./hardware-configuration.nix

udo nixos-rebuild switch --option eval-cache false --flake ./#default &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

echo "System rebuilt successfully! Don't forget to edit the nixos-rebuild.sh script if you want to use git!
PS: This is a great tutorial to set that up: https://www.youtube.com/watch?v=jTHhMSxQTNI"