#!/usr/bin/env bash

# 1) one-time backup of your old config
if [ ! -d /etc/nixos-backup ]; then
  sudo cp -a /etc/nixos /etc/nixos-backup
fi

# 2) mirror everything in ./ → /etc/nixos, delete extras,
#    but leave hardware-configuration.nix untouched
sudo rsync -a \
  --delete \
  --filter="P hardware-configuration.nix" \
  --exclude='.git' \
  ./ /etc/nixos/

# 3) rebuild NixOS
sudo nixos-rebuild switch
