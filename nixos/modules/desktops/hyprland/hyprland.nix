{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    #hyprlauncher
    hyprlock
    hyprpaper
    hypridle
    rofi
    nautilus
    #waybar
    wayle
    imv
  ];
}
