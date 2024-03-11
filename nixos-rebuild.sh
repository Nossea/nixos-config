#!/usr/bin/env bash

current_datetime=$(date +"%Y-%m-%d %H:%M:%S")

set -e

cd /home/nossea/nixos-config/

sudo nixos-rebuild switch --flake /home/nossea/nixos-config#default

git add *

git status

git commit -am "$current_datetime"

git push