{
  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    timeout = 5;

    systemd-boot = {
      enable = true;
      editor = false;
      configurationLimit = 10;
    };

    efi.canTouchEfiVariables = true;
  };
}
