{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        asar
    ];
}