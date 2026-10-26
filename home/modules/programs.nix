{
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
  programs.brave = {
    enable = true;
    package = pkgs-unstable.brave-origin;
  };

  programs.fish = {
    enable = true;
    package = pkgs-unstable.fish;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };

  programs.kitty = {
    enable = true;
    package = pkgs-unstable.kitty;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "fish";
    };
    extraConfig = ''
      copy_on_select clipboard
      mouse_map right press ungrabbed paste_from_clipboard
      #url_color #89b4fa
      url_style dashed
    '';
  };

  programs.starship = {
    enable = true;
    package = pkgs-unstable.starship;
    settings = {
      add_newline = false;
      # Add your custom Starship settings here
    };
  };

  programs.git = {
    enable = true;
    package = pkgs-unstable.git;
    settings.user.name = "Ricardo Machado";
    settings.user.email = "rjfmachado@users.noreply.github.com";
    settings.init.defaultBranch = "main";
  };

  programs.zed-editor = {
    enable = true;
    package = pkgs-unstable.zed-editor;
    extensions = [
      "nix"
      "lua"
      "toml"
      "rust"
      "nvim-nightfox"
      "catppuccin"
      "tokyo-night"
      "github-theme"
    ];
    userSettings = {
      theme = {
        mode = "system";
        dark = "Github Light";
        light = "Github Dark";
      };
      hour_format = "hour24";
    };
  };

  programs.rofi = {
    enable = true;
    package = pkgs-unstable.rofi;
  };
}
