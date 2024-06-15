{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        freetube
        syncplay
        syncthing
        syncthingtray
    ];
}