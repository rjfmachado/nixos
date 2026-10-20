{ pkgs, ... }:

{
  home.username = "ricardo";
  home.homeDirectory = "/home/ricardo";
  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = false;
  home.file.".config/hypr/" = {
    source = ./config/hypr;
    recursive = true;
    force = true;
  };
  home.file.".config/rofi/" = {
    source = ./config/rofi;
    recursive = true;
    force = true;
  };
  home.packages = [
    pkgs.gcr
  ];
  services.gnome-keyring.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
  };
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      shell = "fish";
    };
  };
  programs.git = {
    enable = true;
    settings.user.name = "Ricardo Machado";
    settings.user.email = "rjfmachado@users.noreply.github.com";
    settings.init.defaultBranch = "main";
  };
  programs.zed-editor = {
    enable = true;
  };
}
