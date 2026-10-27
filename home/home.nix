{
  wallpapers,
  pkgs,
  nixpkgs-unstable,
  ...
}:
let
  pkgs-unstable = import nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
  };
in
{
  imports = [
    ./modules/programs.nix
    ./modules/packages.nix
    ./modules/services.nix
  ];

  home.username = "ricardo";
  home.homeDirectory = "/home/ricardo";
  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = true;

  home.file.".config/hypr/" = {
    source = ./config/hypr;
    recursive = true;
    force = true;
  };

  # home.file.".config/rofi/" = {
  #   source = ./config/rofi;
  #   recursive = true;
  #   force = true;
  # };

  home.file."Pictures/Wallpapers".source = wallpapers;

  # https://wiki.nixos.org/wiki/Automatic_system_upgrades
  # services.home-manager.autoUpgrade = {
  #   enable = true;
  #   useFlake = true;
  #   flakeDir = "/home/ricardo/nixos";
  #   frequency = "03:00";
  #   preSwitchCommands = [ "nix flake update" ];
  # };

  services.wayle = {
    enable = true;
    package = pkgs-unstable.wayle;
    autoInstallDependencies = false;

    # tip: you can automatically translate your TOML config to Nix by running
    # nix-instantiate --eval --expr 'builtins.fromTOML (builtins.readFile ./config.toml)' | nixfmt
    settings = {
      bar = {
        background-opacity = 50;
        bg = "transparent";
        scale = 0.5;
        shadow = "drop";
        layout = [
          {
            monitor = "*";
            show = true;
            left = [
              "dashboard"
              "hyprland-workspaces"
            ];
            center = [
              "media"
              "window-title"
            ];
            right = [
              "hyprsunset"
              "idle-inhibit"
              "systray"
              "bluetooth"
              "volume"
              "notifications"
              "weather"
              "clock"
            ];
          }
        ];
      };
      modules = {
        clock = {
          format = "🕛 %H:%M 🗓️ %d/%m";
          dropdown-show-seconds = false;
          icon-show = false;
        };
        bluetooth = {
          label-show = false;
        };
        media = {
          icon-type = "application-mapped";

          player-icons = {
            "*spotify*" = "si-spotify-symbolic";
            "*brave*" = "si-spotify-symbolic";
            "*chromium*" = "si-spotify-symbolic";
          };

          player-priority = [
            "*spotify*"
            "*brave*"
            "*chromium*"
          ];

        };
        weather = {
          location = "Ericeira";
          units = "metric";
        };
        hyprland-workspaces = {
          app-icons-show = true;
          min-workspace-count = 4;
        };
        hyprsunset = {
          label-show = false;
        };
        idle-inhibit = {
          label-show = false;
        };
        volume = {
          label-show = false;
        };
        notifications = {
          label-show = false;
        };
      };
      osd = {
        monitor = "HDMI-A-1";
      };
      styling = {
        theme-provider = "wallust";
        wallust-apply-globally = false;
      };
      wallpaper = {
        engine-enabled = true;
        cycling-directory = "/home/ricardo/Pictures/Wallpapers/other/";
        cycling-enabled = true;
        cycling-mode = "shuffle";
        cycling-interval-mins = 5;
      };
    };
  };
}
