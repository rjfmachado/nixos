{ config, pkgs, ...}:

{
  home.username = "ricardo";
  home.homeDirectory = "/home/ricardo";
  home.stateVersion = "26.05";
  home.file.".config/hypr" = {
    source = ./config/hypr;
    recursive = true;
    force = true;
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
    settings.user.mail = "rjfmachado@users.noreply.github.com";
    settings.init.defaultBranch = "main";
  };
}
