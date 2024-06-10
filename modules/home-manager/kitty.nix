{ inputs, pkgs, ... }:

{
    programs.kitty = {
        enable = true;
        theme = "Adventure Time";
        font.name = "Comic Sans";
    };
}
