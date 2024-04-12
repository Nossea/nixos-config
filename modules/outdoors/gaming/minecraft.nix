{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
    [
        prismlauncher
        alsa-oss
    ];
}