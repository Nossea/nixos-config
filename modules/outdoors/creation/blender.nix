{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        blender
    ];
}