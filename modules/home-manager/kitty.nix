{ inputs, pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        theme = "Adventure Time";
        font = {
            package = pkgs.comic-mono;
            name = "Comic Mono";
        };
        settings = {
            confirm_os_window_close = -0;
        };
    };
}
