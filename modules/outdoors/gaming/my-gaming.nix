{inputs, pkgs, ...}:

{
    imports =
        [
            ./minecraft.nix
            ./steam.nix
            ./local-games.nix
        ];
}
