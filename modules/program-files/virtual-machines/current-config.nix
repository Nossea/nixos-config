{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        bottles
    ];
}