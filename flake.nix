{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake";

    hyprland.url = "github:hyprwm/Hyprland";
  };
  

  outputs = { self, nixpkgs, nixpkgs-stable, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-stable = nixpkgs-stable.legacyPackages.${system};
    in
    {
    
      nixosConfigurations = {
          # My main computer!
        pc = nixpkgs.lib.nixosSystem {
          specialArgs = {
              inherit inputs;
              inherit pkgs-stable;
            };
          modules = [ 
            ./hosts/pc/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };

      nixosConfigurations = {
          # My cool hacking thinkpad (and my testing grounds for hyprland).
        hacking-thinkpad = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/hacking-thinkpad/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}