{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        tor
    ];
}