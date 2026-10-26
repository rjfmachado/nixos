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

  services.hypridle = {
    enable = true;
    package = pkgs-unstable.hypridle;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };

      listener = [
        # Lock the session after 5 minutes.
        {
          timeout = 300;
          on-timeout = "loginctl lock-session";
        }

        # Turn off the monitors after 5 minutes.
        {
          timeout = 300;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    package = pkgs-unstable.hyprlock;
  };

  environment.systemPackages = with pkgs; [
    nautilus
    pkgs-unstable.wayle
    pkgs-unstable.awww
    pkgs-unstable.wallust
    pkgs-unstable.wl-clipboard-rs
    papirus-icon-theme
  ];
}
