{ pkgs, lib, ... }:
{
  # Use the systemd-boot EFI boot loader.
  environment.systemPackages = [
    pkgs.sbctl
  ];
  boot.loader = {
    timeout = 5;

    systemd-boot = {
      enable = lib.mkForce false;
      editor = false;
      configurationLimit = 10;
    };

    efi.canTouchEfiVariables = true;
  };
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
