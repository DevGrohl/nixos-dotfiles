# This module contains packages and settings for gaming.

{
  config,
  pkgs,
  ...
}: {
  # Enable the Steam program
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Install other gaming-related packages
  environment.systemPackages = with pkgs; [
    lutris
    heroic-games-launcher-bin
    gamemode
    mangohud
    gamescope

    # Add other tools like protontricks if needed
    # protontricks
  ];
}
