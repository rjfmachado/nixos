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

#     fonts-devicons = {
#       url = "git+https://github.com/devicons/devicon.git?shallow=1";
#       flake = false;
#     };
#
#     fonts-nerdfonts = {
#       url = "git+https://github.com/ryanoasis/nerd-fonts.git?shallow=1";
#       flake = false;
#     };

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
              };
            };
          }
        ];
      };
    };
}
