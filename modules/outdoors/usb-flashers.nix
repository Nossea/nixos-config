{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        ventoy
    ];
}
