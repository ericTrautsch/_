# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }@inputs:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

nix = {
	package = pkgs.nixFlakes;
	extraOptions = ''
	 experimental-features =  nix-command flakes
	'';
};

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

networking.hostName = "homelab-desktop"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
time.timeZone = "America/Chicago";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
 i18n.defaultLocale = "en_US.UTF-8";
 console = {
   font = "Lat2-Terminus16";
   keyMap = "us";
   # useXkbConfig = true; # use xkb.options in tty.
 };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
 users.users.erict= {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
         openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDO9zPDHgWMhQGDLHa8cQVfzI7lBQvlvVCv73POEl4LokZBqnM2vSIFKxpjyC+MmWKuoQ7VumNhq6ck0Kh7++7bMV8DHdjBg7lVXVswUHwfp+Lk0A1xU6aQp6+nyt2aiOVEd+Cet0Wltl5rJnE9m8nIfJLy5K2ZOs2wGS7vfxMAKWn9G71eH/+BG5BZ6RDqpZybKy4FfQPSjPtL51Mf/eBoFBhSbIz9Xdb4wg5EWNl0NpLjL/tnfY6Z9pRv4DQIcHK+4xhuB9Z1SLvXsrBc7hJwRuO3J2KxiGppkc5t6AxVHcdtiDzk83jjzSem+sQEfwFoaYJGDKrzRT8ilC7zZdh38vPRtkqZrNmUKxUcpJCkmSwH1kPuYuJFu17rur751baycTGXFZlMbaBKMyMOV/3nOhazQ0uOASnzU1MK7XS4o8dPThjuiUmcNZLzVa46iecwmYZXrRVX9sfOg1RLNS1lUVLD+tbMSw+FzbLTFP+GVvG9Omrjq0TByCO3nwDFE90="
    ];
     packages = with pkgs; [
	firefox
	tree
     ];
 };

# home-manager = {
#	# also pass inputs to home manager modules
#	extraSpecialArgs = { inherit inputs; };
#	users = {
#	  "erict" = import ./home.nix;
#	};
# };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    home-manager
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
 networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

