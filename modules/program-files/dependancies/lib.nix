{inputs, pkgs, ...}:

{
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        # Add any missing dynamic libraries for unpackaged programs here, NOT in environment.systemPackages
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
        xorg.libxcb
        libxkbcommon
        mesa
        expat
        alsa-lib
        electron_28
    ];
}