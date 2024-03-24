{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        syncthing
        syncthingtray
    ];
}
