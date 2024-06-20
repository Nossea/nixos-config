{ inputs, pkgs, ... }:

{
    home.packages = with pkgs; [
        #(pkgs.discord.override { withVencord = true; })
        #vesktop
    ];
}