# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  #  ------- SYSTEM SETTINGS -------  #

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # Define your hostname.
  networking.hostName = "nixos"; 
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;


#  ------- USER SETTTINGS -------  #


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nossea = 
  {
    isNormalUser = true;
    description = "Nossea";
    extraGroups = [ "networkmanager" "wheel" "root" ];
    packages = with pkgs; [
      firefox
      thunderbird
    ];
  };


  # Set your time zone.
  time.timeZone = "America/Los_Angeles";


  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = 
  {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  #  ------- IMPORTS AND PACKAGES -------  #

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/program-files/global.nix
      ../../modules/program-files/nvidia.nix
      ../../modules/program-files/dependancies/active-dependencies.nix
      ../../modules/program-files/programming-files/active-programming-files.nix
      ../../modules/program-files/virtual-machines/current-config.nix
      inputs.home-manager.nixosModules.default
      ../../modules/outdoors/media.nix
      ../../modules/outdoors/desktop-enviornments/kde-plasma.nix
      ../../modules/outdoors/gaming/my-gaming.nix
      ../../modules/outdoors/usb-flashers.nix
      ../../modules/outdoors/revolt.nix
      ../../modules/outdoors/creation/obs.nix
      ../../modules/outdoors/creation/blender.nix
      ../../modules/program-files/moonshine.nix
      ../../modules/outdoors/security-tools/networks.nix
    ];


  home-manager = 
  {
    #also pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs; };
    users = {
      "nossea" = import ./home.nix;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; 
  [
    thunderbird
    virt-manager
    alacritty
    parsec-bin
    keepassxc
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
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
