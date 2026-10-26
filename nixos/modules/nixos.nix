{
  pkgs,
  flakePath,
  flakeTarget,
  ...
}:
# This fixes Auto Upgrade failing from a flake in my home dir https://wiki.nixos.org/Wiki/Automatic_system_upgrades
let
  rootGitConfig = pkgs.writeText "root-gitconfig" ''
    [safe]
        directory = ${flakePath}
  '';
in
{
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";

  systemd.tmpfiles.rules = [
    "L+ /root/.gitconfig - - - - ${rootGitConfig}"
  ];

  # Manage NixOS generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.autoUpgrade = {
    enable = true;
    flake = "/home/ricardo/nixos";
    flags = [
      "-L" # print build logs
      "--commit-lock-file"
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };

  environment.systemPackages = [
    (pkgs.writeShellApplication {
      name = "nos";

      runtimeInputs = [ pkgs.nixos-rebuild ];

      text = ''
        sudo nixos-rebuild switch --flake .#"${flakeTarget}" "$@"
      '';
    })
    (pkgs.writeShellApplication {
      name = "nfu";

      runtimeInputs = [ pkgs.nix ];

      text = ''
        nix flake update --flake "${flakePath}"
      '';
    })
  ];

}
