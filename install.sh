#!/usr/bin/env bash

# 1) make a one-time backup of your entire config
if [ ! -d /etc/nixos-backup ]; then
    sudo cp -a /etc/nixos /etc/nixos-backup
fi

# 2) mirror everything *except* hardware-configuration.nix
sudo rsync -av \
  	--exclude='hardware-configuration.nix' \
  	./ /etc/nixos/

# 3) rebuild with your preserved hardware file
sudo nixos-rebuild switch
