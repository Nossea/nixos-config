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
          # The default config
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/default/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };

      nixosConfigurations = {
          # The lightweight config. For laptops mostly.
        lightweight = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/lightweight/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };

      nixosConfigurations = {
          # The ethical hacking config ("ethical hacking" is too long of a variable (and doesn't sound as cool :3)).
        hacking = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./hosts/hacking/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}