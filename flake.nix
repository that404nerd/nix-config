{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let 
    system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
  };

  in
  {
     nixosConfigurations = {
       revanth-nixos = nixpkgs.lib.nixosSystem {
         specialArgs = { inherit inputs; };

         modules = [
           ./configuration.nix
         ];
       };
     };
  };
}
