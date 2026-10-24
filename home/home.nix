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

  services.wayle = {
      enable = true;

      # Whether to automatically install soft dependencies used by wayle that
      # will be required based on your config.
      autoInstallDependencies = true;

      # tip: you can automatically translate your TOML config to Nix by running
      # nix-instantiate --eval --expr 'builtins.fromTOML (builtins.readFile ./config.toml)' | nixfmt
      settings = {
        bar = {
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
                "microphone"
                "notifications"
                "weather"
                "clock"
                "power"


              ];
            } # this is a 'list' of 'attribute sets', no semi-colons after the closing braces needed
          ];
        };
        modules = {
          clock = {
            format = "%H:%M";
            dropdown-show-seconds = false;
          };
          weather = {
            location = "Ericeira";
            units = "metric";
          };
        };
        osd = {
          monitor = "HDMI-A-1";
        };
        styling = {
          palette = {
            bg = "#1e1e2e";
            surface = "#313244";
            elevated = "#45475a";

            fg = "#cdd6f4";
            fg-muted = "#a6adc8";

            primary = "#cba6f7";

            red = "#f38ba8";
            yellow = "#f9e2af";
            green = "#a6e3a1";
            blue = "#89b4fa";
          };
          # wallust will be automatically installed if this is set
          #theme-provider = "wallust";
          theme-provider = "wayle";
        };
        # the following wallpaper option can be omitted if you're not using
        # wayle's wallpaper engine
        wallpaper = {
          # this will automatically install aww
          engine-enabled = true;

          cycling-directory = "/home/ricardo/Picture/Wallpapers/other/";
          cycling-enabled = true;
          cycling-mode = "shuffle";
          cycling-interval = 5;
        };
      };
    };
}
