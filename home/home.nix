{
  wallpapers,
  ...
}:
{
  imports = [
    ./modules/programs.nix
    ./modules/packages.nix
  ];
  home.username = "ricardo";
  home.homeDirectory = "/home/ricardo";
  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = false;
  home.file.".config/hypr/" = {
    source = ./config/hypr;
    recursive = true;
    force = true;
  };
  home.file."Pictures/Wallpapers".source = wallpapers;
  home.file.".config/rofi/" = {
    source = ./config/rofi;
    recursive = true;
    force = true;
  };

  # https://wiki.nixos.org/wiki/Automatic_system_upgrades
  services.home-manager.autoUpgrade = {
    enable = true;
    useFlake = true;
    flakeDir = "/home/ricardo/nixos";
    frequency = "03:00";
    preSwitchCommands = [ "nix flake update" ];
  };
}
