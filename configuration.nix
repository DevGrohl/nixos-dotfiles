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

  # This value determines the NixOS release from which the default
  # settings for stateful data were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = "25.05";
}
