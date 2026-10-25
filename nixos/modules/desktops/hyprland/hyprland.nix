{ pkgs, nixpkgs-unstable, ... }:
let
  pkgs-unstable = import nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
  };
in
{
  programs.hyprland = {
    enable = true;
    package = pkgs-unstable.hyprland;
  };

  environment.systemPackages = with pkgs; [
    pkgs-unstable.hyprlock
    pkgs-unstable.hyprpaper
    pkgs-unstable.hypridle
    nautilus
    pkgs-unstable.wayle
    papirus-icon-theme
    #papirus-nord
  ];
}
