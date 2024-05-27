{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
    [
        libremines
    ];
}