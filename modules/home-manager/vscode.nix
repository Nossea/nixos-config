{ inputs, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      asvetliakov.vscode-neovim
    ];
  };
}
