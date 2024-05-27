{inputs, pkgs, ...}:

{
    programs.alvr.enable = true;
    programs.corectrl.enable = true;
    programs.alvr.openFirewall = true;

    environment.systemPackages = [

    ];
}