# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/program-files/global.nix
      ../../modules/outdoors/desktop-enviornments/hyprland.nix
      ../../modules/outdoors/security-tools/full-security-suite.nix
     ];


  home-manager = 
  {
    #also pass inputs to home-manager modules
    extraSpecialArgs = { inherit inputs; };
    users = {
      "nossea" = import ./home.nix;
    };
  };
}
