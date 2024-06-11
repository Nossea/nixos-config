{ config, pkgs, inputs, ... }:

{
    # All global packages are here. Basically a "starter config".

    # Bootloaders

    # Grub is slowly getting phased out and thus should be avoided but if that is impossible you can install it here:
    #boot.loader.grub.enable = true;
    #boot.loader.grub.device = "/dev/vda";
    #boot.loader.grub.useOSProber = true;

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Global packages
    environment.systemPackages = with pkgs; 
    [
        libnotify
        swaynotificationcenter
        firefox
        pika-backup
        libsForQt5.ark
        mpv
        obsidian # Notes are important, don't judge me!
        p7zip
        translate-shell
        nh
        flameshot
        nix-index
        dmidecode
        discordchatexporter-cli
        usbimager
        tutanota-desktop
        fastfetch
        kdePackages.kmenuedit
    ];

    programs.partition-manager.enable = true;

    imports = 
    [
        #./dependancies/shotman.nix
    ];

    # Enable flakes:
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Enable networking
    networking.networkmanager.enable = true;

    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        # jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;
}
