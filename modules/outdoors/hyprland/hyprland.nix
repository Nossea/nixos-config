{inputs, pkgs, ...}:

{
    imports = 
    [
        ./waybar.nix
    ];

    environment.systemPackages = with pkgs; [
        rofi-wayland
    ];

    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    # Enables Hyprlnd
    programs.hyprland = 
    {
        enable = true;
        xwayland.enable = true;
    };


    environment.sessionVariables = 
    {
        # If cursor is invisible
        #WLR_NO_HARDWARE_CURSORS = "1";

        # Hint Electron apps to use Wayland
        NIXOS_OZONE_WL = "1";
    };


    hardware = 
    {
        # OpenGL
        opengl.enable = true;

        # Required by most Wayland compositors    
        nvidia.modesetting.enable = true; 
    };
}