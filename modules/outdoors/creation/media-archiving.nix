{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        dvdbackup
        handbrake
        makemkv
        ffmpeg
    ];
}