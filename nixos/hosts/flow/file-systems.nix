{
  fileSystems."/home/ricardo/work" = {
    depends = [
      "/home"
    ];
    device = "/dev/disk/by-uuid/837af138-3aaa-42f0-a7b6-f16cb5290f8e";
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
    ];
  };

  fileSystems."/home/ricardo/dev" = {
    depends = [
      "/home"
    ];
    device = "/dev/disk/by-uuid/52f21c13-f063-44a3-8e7c-611f095d8104";
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
    ];
  };
}
