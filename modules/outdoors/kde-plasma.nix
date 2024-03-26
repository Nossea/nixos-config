  {inputs, pkgs, ...}:

  
  {  
    # Enable the KDE Plasma Desktop Environment.
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager = 
    {
      plasma5.enable = true;
      xterm.enable = false;
    };

    services.xserver.excludePackages = [ pkgs.xterm ];
    
    # Exclude unwanted packages from Plasma.
    environment.plasma5.excludePackages = with pkgs.libsForQt5; 
    [
      plasma-browser-integration
      konsole
      oxygen
      pkgs.plasma5Packages.dolphin
    ];

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Configure keymap in X11
    services.xserver = 
    {
        layout = "us";
        xkbVariant = "";
    };
  }