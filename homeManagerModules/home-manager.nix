{inputs, ...}: {
    home-manager = {
        extraSpecialArgs = { inherit inputs; }
        users = {
            "erict" = import ./default.nix
          }
      }
  }
