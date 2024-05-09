{ config, pkgs, callPackage, ... }: 

{
  # if you use pulseaudio
  nixpkgs.config.pulseaudio = true;

  environment.systemPackages = with pkgs;
  [
    xfce.xfce4-pulseaudio-plugin
    pavucontrol
  ];
  
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = true;
    };
    displayManager.defaultSession = "xfce";
  };
}
