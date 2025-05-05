#!/usr/bin/env bash

if [ ! -d /etc/nixos-backup ]; then
	sudo cp -rf /etc/nixos /etc/nixos-backup
fi

sudo cp -vrf . /etc/nixos/

sudo nixos-rebuild switch