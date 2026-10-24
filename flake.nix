{
  description = "NixOS on Flow";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    # wallr = {
    #   url = "github:programmersd21/wallr/v0.8.3";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    wallpapers = {
      url = "github:rjfmachado/wallpapers";
      flake = false;
    };

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      wallpapers,
      catppuccin,
      ...
    }:
    {
      nixosConfigurations.flow = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          flakePath = "/home/ricardo/nixos";
          flakeTarget = "flow";
        };
        modules = [
          ./nixos/configuration.nix
          ./nixos/hosts/flow
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.ricardo = import ./home/home.nix;
              backupFileExtension = "backup";
              extraSpecialArgs = {
                inherit wallpapers;
                inherit nixpkgs-unstable;
                inherit catppuccin;
              };
            };
          }
        ];
      };
    };
}
