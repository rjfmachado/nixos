{
  pkgs,
  #config,
  #nixpkgs-unstable,
  ...
}:
# let
#   pkgs-unstable = import nixpkgs-unstable {
#     inherit (pkgs.stdenv.hostPlatform) system;
#     #inherit (config.nixpkgs) config;
#   };
# in
{
home.packages = with pkgs; [
  adw-gtk3
  gnome-themes-extra
  adwaita-qt
  adwaita-qt6
  fastfetch
  nixpgks-unstable.gthumb
];
}
