{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
    ./kernel.nix
    ./graphics.nix
    ./file-systems.nix
    ./networking.nix
    ../../modules/services/keyring.nix
    ../../modules/desktops/hyprland/hyprland.nix
    ../../modules/services/ly.nix
    ../../modules/services/bluetooth.nix
    ../../modules/services/audio.nix
  ];
}
