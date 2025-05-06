{
  description = "My first flake!";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };
    nur = {
      url = "github:nix-community/NUR";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nur, ... }:
    let
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        nixos-tutorial-hostname = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
          specialArgs = { inherit inputs outputs; };  # Pass nur as a special argument
        };
      };
    };
}