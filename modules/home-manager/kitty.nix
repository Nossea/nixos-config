{ inputs, pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        theme = "Catppuccin-Mocha";
        font = {
            package = pkgs.comic-mono;
            name = "Comic Mono";
        };

        settings = {
            confirm_os_window_close = 0;
            background_opacity = "0.7";
        };
    };
}
