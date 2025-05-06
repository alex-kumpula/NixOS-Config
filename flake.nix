{
  description = "My first flake!";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };
  };

  outputs = { self, nixpkgs, ... }: 
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      nixos-tutorial-hostname = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };
    };
  };
}