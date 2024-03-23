{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        revolt-desktop
    ];
}