{
  description = "NixOS on Flow";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";

    # wallr = {
    #   url = "github:programmersd21/wallr/v0.8.3";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # catppuccin = {
    #   url = "github:catppuccin/nix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
      #}@inputs:
    }:
    {
      nixosConfigurations.flow = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        #specialArgs = { inherit inputs; };
        specialArgs = {
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
            };
          }
        ];
      };
    };
}
