{
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.ly.enableGnomeKeyring = true;
  programs.seahorse.enable = true;
  #environment.variables.XDG_RUNTIME_DIR = "/run/user/$UID";
}
