{inputs, pkgs, ...}:

{
    programs.hyprland.enable = true;
    environment.systemPackages = with pkgs; 
    [
        ags
        swaynotificationcenter
    ];
}