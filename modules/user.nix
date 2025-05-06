{ config, pkgs, ... }:

{
  users.users.main = {
    isNormalUser = true;
    description = "main";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      #thunderbird # moved to desktop.nix
    ];
  };
}