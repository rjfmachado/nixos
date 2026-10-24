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
home.packages = with pkgs; [
  adw-gtk3
  gnome-themes-extra
  adwaita-qt
  adwaita-qt6
  fastfetch
  pkgs-unstable.gthumb
  pkgs-unstable.brave-origin
  pkgs-unstable.awww
  pkgs-unstable.hyprsunset
];
}
