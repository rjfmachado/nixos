{ pkgs, flakeTarget, ... }:
{
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";

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
    #flake = "/home/ricardo/nixos";
    flake = "${flakeTarget}";
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
  ];
}
