{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xremap-flake.url = "github:xremap/nix-flake";

    hyprland.url = "github:hyprwm/Hyprland";
  };
  

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations = {
          # My main computer!
        pc = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
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