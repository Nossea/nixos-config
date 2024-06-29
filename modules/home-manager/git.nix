{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    git-crypt
    gnupg
  ];

  programs.git = {
    userEmail = "iamnossea@gmail.com";
    userName = "Nossea";
  };
}
