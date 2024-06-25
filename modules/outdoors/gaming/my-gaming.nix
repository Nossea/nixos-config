{inputs, pkgs, ...}:

{
    imports =
        [
            ./minecraft.nix
            ./steam.nix
            #./local-games.nix
            #./rimsort.nix
            ./ryujinx.nix
            ./vr.nix
        ];
}
