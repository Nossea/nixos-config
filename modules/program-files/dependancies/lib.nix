{inputs, pkgs, ...}:

{
    programs.nix-ld.enable = true;
        ## If needed, you can add missing libraries here. nix-index-database is your friend to
        ## find the name of the package from the error message:
        ## https://github.com/nix-community/nix-index-database
    #programs.nix-ld.libraries = options.programs.nix-ld.libraries.default ++ (with pkgs; [ yourlibrary ]);
}