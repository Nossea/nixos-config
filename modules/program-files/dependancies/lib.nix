{inputs, pkgs, ...}:

{
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        # Add any missing dynamic libraries for unpackaged programs here, NOT in environment.systemPackages

        # DNA
        glib
        nss
        nspr
        dbus
        atk
        cups
        libdrm
        gtk3
        pango
        cairo
        xorg.libX11
        xorg.libXcomposite
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXrandr
        xorg.libXrender
        xorg.libxcb
        xorg.libXtst
        xorg.libXi
        xorg.libxshmfence
        xorg.libxkbfile
        libxkbcommon
        mesa
        expat
        alsa-lib
        electron
        libglvnd
        fontconfig
        freetype
        libkrb5
        # End of DNA (or just use steam-run like a normal person (since this doesn't actually work anyways :P))
    ];
}