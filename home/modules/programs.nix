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
  programs.firefox.enable = true;
  #programs.brave.enable = true;

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
  };

  programs.rofi = {
    enable = true;
    package = pkgs-unstable.rofi;

    # Only the application launcher is enabled.
    modes = [ "drun" ];

    # Load our custom layout.
    #theme = "launcher";

    extraConfig = {
      show-icons = true;
      icon-theme = "Papirus";
      drun-display-format = "{name}";
      display-drun = "Applications";
      disable-history = false;
      sort = true;
    };
  };

  # programs.nix-ld = {
  #   enable = true;
  #   # libraries = with pkgs; [
  #   # ];
  # };
}
