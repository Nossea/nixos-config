{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        slurp
        shotman
        sway
    ];
}