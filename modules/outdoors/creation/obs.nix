{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        obs-studio
    ];
}