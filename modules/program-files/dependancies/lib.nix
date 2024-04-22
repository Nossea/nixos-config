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
        stdenv.cc.cc
        openssl
        libGL
        libva
        pipewire
        xorg.libXxf86vm
        libelf
        
        # Required
        gtk2
        bzip2
        # Without these it silently fails
        xorg.libXinerama
        xorg.libXcursor
        xorg.libXScrnSaver
        xorg.libSM
        xorg.libICE
        gnome2.GConf
        libcap
        SDL2
        libusb1
        dbus-glib
        ffmpeg
        # Only libraries are needed from those two
        libudev0-shim
        # Verified games requirements
        xorg.libXt
        xorg.libXmu
        libogg
        libvorbis
        SDL
        SDL2_image
        glew110
        libidn
        tbb
        # Other things from runtime
        flac
        freeglut
        libjpeg
        libpng
        libpng12
        libsamplerate
        libmikmod
        libtheora
        libtiff
        pixman
        speex
        SDL_image
        SDL_ttf
        SDL_mixer
        SDL2_ttf
        SDL2_mixer
        libappindicator-gtk2
        libdbusmenu-gtk2
        libindicator-gtk2
        libcaca
        libcanberra
        libgcrypt
        libvpx
        librsvg
        xorg.libXft
        libvdpau
        gnome2.pango
        gdk-pixbuf
        alsaLib
        # Needed for electron
        # End of DNA (or just use steam-run like a normal person (since this doesn't actually work anyways :P))
    ];
}