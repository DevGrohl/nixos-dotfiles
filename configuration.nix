# This is the main configuration file for this specific host (nixos).

{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Import all the modules we defined
  imports = [
    # Import hardware-specific settings. You must copy this file from /etc/nixos/.
    ./hardware-configuration.nix

    # Import our modular configuration files
    ./modules/system.nix
    ./modules/development.nix
    ./modules/gaming.nix
  ];

  # --- HOST-SPECIFIC CONFIGURATION ---
  # These settings are specific to this machine.

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Your hostname
  networking.hostName = "nixos";

  # NVIDIA Drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Crucial for Steam and many games
  };
  hardware.nvidia = {
    modesetting.enable = true;
    # Use the proprietary drivers
    open = false;
    nvidiaSettings = true;
    # This is needed for CUDA, etc.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  fileSystems."/mnt/shared" = {
    device = "/dev/disk/by-uuid/58B5752B7D7FBBAE";
    fsType = "ntfs";
    options = [
      "defaults"
      "noatime"
      "nofail"
      "uid=1000"
      "gid=100"
      "umask=002"
    ];
  };

  fileSystems."/mnt/steam" = {
    device = "/dev/disk/by-uuid/76E0774A69AAECB4";
    fsType = "ntfs";
    options = [
      "defaults"
      "noatime"
      "nofail"
      "uid=1000"
      "gid=100"
      "umask=002"
    ];
  };


  fileSystems."/mnt/arch" = {
    device = "/dev/disk/by-uuid/fa68aa26-1acc-43bd-af6b-5f0a6ae66dac";
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
      "nofail"
      # "uid=1000"
      # "gid=100"
      # "umask=002"
    ];
  };

  systemd.tmpfiles.rules = [
    "d /mnt/shared 0755 devgrohl users -"
    "d /mnt/steam  0755 devgrohl users -"
    "d /mnt/arch   0755 devgrohl users -"
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "25.05";
}
