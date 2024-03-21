{inputs, pkgs, ...}:

{
    environment.systemPackages = with pkgs; 
    [
        # Lutris
        #lutris-unwrapped  # (not needed)
        lutris

        # Extra dependencies
        # https://github.com/lutris/docs/
        gnutls
        openldap
        libgpgerror
        freetype
        sqlite
        libxml2
        xml2
        SDL2
    ];
}
    