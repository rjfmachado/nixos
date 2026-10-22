{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    git
    kitty
    hyprlauncher
    hyprlock
    hyprpaper
    hypridle
    rofi
    nautilus
    waybar
    msedit
    nixd # needed for Zed lsp
    nil # needed for Zed lsp
    lua-language-server # needed for Zed lsp
    package-version-server # needed for Zed lsp
    #libsecret
    #inputs.wallr.packages.${pkgs.stdenv.hostPlatform.system}.wallr
  ];
}
