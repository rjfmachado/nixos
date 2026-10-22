{ ... }:

{
  imports = [
    ./modules/networking.nix
    ./modules/regional-portugal.nix
    ./modules/users.nix
    ./modules/nixos.nix
    ./modules/system-packages.nix
    ./modules/fonts.nix
    #./modules/fonts.nix
  ];
}
