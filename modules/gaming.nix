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

  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  # Install other gaming-related packages
  environment.systemPackages = with pkgs; [
    # lutris
    # heroic-games-launcher-bin
    # gamemode
    mangohud
    gamescope
    streamlink
    obs-studio
    # Add other tools like protontricks if needed
    protontricks
  ];

  # programs.steam.gamescopeSession.enable = true;
}
