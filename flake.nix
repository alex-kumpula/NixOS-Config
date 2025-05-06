{
  description = "My first flake!";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };
    nur = {
      url = "github:nix-community/NUR";
      # Removed the follows line to let NUR use its own nixpkgs
    };
  };

  outputs = { 
    self, 
    nixpkgs, 
    nur, 
    ... 
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    nurPkgs = import nur {
      inherit system;  # Only pass system, let NUR handle its own nixpkgs
    };
  in {
    nixosConfigurations = {
      nixos-tutorial-hostname = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./configuration.nix 
        ];
        specialArgs = { inherit inputs outputs pkgs nurPkgs; };
      };
    };
  };
}