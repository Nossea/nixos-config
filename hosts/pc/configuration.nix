# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  #  ------- IMPORTS AND PACKAGES -------  #

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/program-files/global.nix
      ../../modules/program-files/virtual-machines/bottles.nix
      ../../modules/outdoors/media.nix
      ../../modules/outdoors/desktop-enviornments/kde-plasma.nix
      ../../modules/outdoors/gaming/my-gaming.nix
      ../../modules/outdoors/usb-flashers.nix
      ../../modules/outdoors/revolt.nix
      ../../modules/outdoors/discord.nix
      ../../modules/outdoors/creation/obs.nix
      ../../modules/outdoors/creation/blender.nix
      ../../modules/program-files/moonshine.nix
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
    parsec-bin
  ];
}
