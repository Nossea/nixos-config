#!/usr/bin/env bash

set -e

echo "Only sudo this if this config is within a folder of it's own as it will build a structured directory that extends outside of nixos-config. 
I recommend setting this directory as "~/home/Nixos/nixos-config" personally. Make sure to create your own host with the generated hardware-configuration.nix file too so it actually runs."

sudo clear

echo "What host will you be using? The avalible options are equal to the names of the folders in the "hosts" directory."
read configName

trueConfig="./#"$configName
writtenConfig='CONFIG="'$trueConfig'"'
echo $writtenConfig > ../selected-config.txt

sudo nixos-rebuild switch --option eval-cache false --flake $trueConfig &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)

echo "System rebuilt successfully! Don't forget to edit the git.nix config if you want to use git!
PS: This is a great tutorial to set that up: https://www.youtube.com/watch?v=jTHhMSxQTNI"