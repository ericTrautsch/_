{ config, pkgs, ... }:

{
  home.username = "erict";
  home.homeDirectory = "/home/erict";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # Core CLI utilities
    git
    
    wget
    fd
    ripgrep
    
    # editor stuff 
    neovim
  ];

}

