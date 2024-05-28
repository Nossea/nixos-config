{inputs, pkgs, ...}:

{
    programs.alvr.enable = true;
    programs.alvr.openFirewall = true;

    environment.systemPackages = with pkgs; [
        sidequest
    ];
}