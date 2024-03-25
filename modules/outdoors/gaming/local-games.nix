{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
    [
        libremines # Somehow minesweeperonline.com gives you false information while using Nixos!! What????
    ];
}