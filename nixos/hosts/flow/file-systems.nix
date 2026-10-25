{
  # Filesystems
  # fileSystems."/home/ricardo/work" = {
  #   depends = [
  #     "/home"
  #   ];
  #   device = "/dev/disk/by-uuid/d396e2b5-1536-42f0-a021-92fcf2e81bdb";
  #   fsType = "ext4";
  #   options = [
  #     "defaults"
  #     "noatime"
  #   ];
  # };

  fileSystems."/home/ricardo/dev" = {
    depends = [
      "/home"
    ];
    device = "/dev/disk/by-uuid/509ecce2-066f-4e88-8f6f-5f740d69c5a8";
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
    ];
  };
}
