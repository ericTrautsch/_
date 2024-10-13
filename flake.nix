{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

     dotfiles = {
       url = "github:ericTrautsch/dotfiles";
       inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = { self, nixpkgs, dotfiles, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/homelab-desktop/configuration.nix
        dotfiles.homeConfigurations."erict"
      ];
    };
  };
}
