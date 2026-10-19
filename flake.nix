{
  description = "NixOS on Flow";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations.flow = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
	{
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.ricardo = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
