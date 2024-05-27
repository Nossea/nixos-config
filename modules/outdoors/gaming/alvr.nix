{inputs, pkgs, ...}:

{
    programs.alvr.enable = true;
    programs.alvr.openFirewall = true;

    environment.systemPackages = [
        pkgs.corectrl
    ];
}