{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.fira-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    nerd-fonts.roboto-mono
    nerd-fonts.adwaita-mono
    nerd-fonts.sauce-code-pro
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    source-han-sans
    source-han-serif
    adwaita-fonts
  ];
}
