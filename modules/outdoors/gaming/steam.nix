{inputs, pkgs, ...}:

{
  #enable Steam: https://linuxhint.com/how-to-instal-steam-on-nixos/
  programs.steam.enable = true;
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        pango
        libthai
        harfbuzz
      ];
    };
  };
  
  
  environment.systemPackages = with pkgs; 
  [
    # Steam 
    mangohud
    gamemode
    protonup-qt

    # WINE 
    wine
    winetricks
    protontricks
    vulkan-tools
    
    # Useful configuration tools
    gamemode
    gamescope
  ];
}