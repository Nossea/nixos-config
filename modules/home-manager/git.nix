{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    git-crypt
    gnupg
  ];
}
