{
  description = "NixOS";
  inputs = {

    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/";
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

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      wallpapers,
      #catppuccin,
      #stylix,
      ...
    }:
    {
      nixosConfigurations.flow = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          flakePath = "/home/ricardo/nixos";
          flakeTarget = "flow";
          inherit nixpkgs-unstable;
        };
        modules = [
          ./nixos/configuration.nix
          ./nixos/hosts/flow
          #catppuccin.nixosModules.catppuccin
          #stylix.nixosModules.stylix
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
                #inherit catppuccin;
              };
            };
          }
        ];
      };
    };
}
