{ inputs, pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        theme = "Adventure Time";
        font.name = "Comic Sans";
        settings = {
            confirm_os_window_close = -1;
        };
    };
}
