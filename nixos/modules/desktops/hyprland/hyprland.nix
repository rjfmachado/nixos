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
    nautilus
    pkgs-unstable.awww
    pkgs-unstable.wallust
    pkgs-unstable.wl-clipboard-rs
    papirus-icon-theme
    pkgs-unstable.rofimoji
  ];
  systemd.user.targets.hyprland-session = {
    description = "Hyprland session";

    bindsTo = [ "graphical-session.target" ];
    wants = [ "graphical-session-pre.target" ];
    after = [ "graphical-session-pre.target" ];

    unitConfig.PropagatesStopTo = "graphical-session.target";
  };
}
