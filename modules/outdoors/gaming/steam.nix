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
    mangohud

    # WINE 
    wine
    winetricks
    protontricks
    vulkan-tools
  ];

  # Very useful configuration tools
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
}