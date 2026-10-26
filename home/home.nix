{
  wallpapers,
  #catppuccin,
  ...
}:
{
  imports = [
    ./modules/programs.nix
    ./modules/packages.nix
    ./modules/services.nix
    #catppuccin.homeModules.catppuccin
  ];

  # catppuccin = {
  #   accent = "blue";
  #   autoEnable = true;
  #   enable = true;
  #   flavor = "macchiato";
  #   #brave.enable = true;
  #   #chromium.enable = true;
  #   #hyprland.enable = true;
  #   #hyprlock.enable = true;
  #   #hyprtoolkit.enable = true;
  #   kitty.enable = true;
  #   #rofi.enable = true;
  #   #rofi.flavor = "latte";
  #   #starship.enable = true;
  #   #zed.enable = true;
  #   #gtk.icon.enable = true;
  # };

  home.username = "ricardo";
  home.homeDirectory = "/home/ricardo";
  home.stateVersion = "26.05";
  #home.enableNixpkgsReleaseCheck = false;

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
  services.home-manager.autoUpgrade = {
    enable = true;
    useFlake = true;
    flakeDir = "/home/ricardo/nixos";
    frequency = "03:00";
    preSwitchCommands = [ "nix flake update" ];
  };

  services.wayle = {
    enable = true;

    # Whether to automatically install soft dependencies used by wayle that
    # will be required based on your config.
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
          # add more attribute sets with different monitors if wayle should
          # have different layouts on each
          {
            monitor = "HDMI-A-1"; # replace "DP-1" with "*" for all monitors
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
              #"cpu"
              #"ram"
              #"network"
              "bluetooth"
              "volume"
              "notifications"
              "weather"
              "clock"
            ];
          } # this is a 'list' of 'attribute sets', no semi-colons after the closing braces needed
        ];
      };
      modules = {
        clock = {
          format = "%H:%M";
          dropdown-show-seconds = false;
          icon-show = false;
        };
        bluetooth = {
          label-show = false;
        };
        # dashboard = {
        #   border-color = "transparent";
        #   icon-bg-color = "transparent";
        #   icon-color = "status-info";
        # };
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
        #         palette = {
        #           bg = "#1e1e2e";
        #           surface = "#313244";
        #           elevated = "#45475a";
        #
        #           fg = "#cdd6f4";
        #           fg-muted = "#a6adc8";
        #
        #           primary = "#cba6f7";
        #
        #           red = "#f38ba8";
        #           yellow = "#f9e2af";
        #           green = "#a6e3a1";
        #           blue = "#89b4fa";
        #         };
        # wallust will be automatically installed if this is set
        theme-provider = "wallust";
        #theme-provider = "wayle";
      };
      # the following wallpaper option can be omitted if you're not using
      # wayle's wallpaper engine
      wallpaper = {
        # this will automatically install aww
        engine-enabled = true;

        cycling-directory = "/home/ricardo/Pictures/Wallpapers/other/";
        cycling-enabled = true;
        cycling-mode = "shuffle";
        cycling-interval-mins = 5;
      };
    };
  };
}
