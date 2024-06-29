{inputs, pkgs, ...}:

{
    programs.hyprland.enable = true;
    environment.systemPackages = [
        pkgs.ags
        swaynotificationcenter
    ];
}