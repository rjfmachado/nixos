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

    # commandLineArgs = [
    #   "--password-store=gnome"
    # ];
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

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
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
      "git-firefly"
    ];
    userSettings = {
      theme = {
        mode = "system";
        dark = "GitHub Dark";
        light = "GitHub Light";
      };
      format_on_save = "modifications_if_available";
      cli_default_open_behavior = "new_window";
      tab_bar = {
        show_nav_history_buttons = true;
        show = false;
      };
      title_bar = {
        button_layout = "platform_default";
        show_menus = false;
        show_user_menu = true;
      };
    };
  };

  programs.rofi = {
    enable = true;
    package = pkgs-unstable.rofi;
  };
}
