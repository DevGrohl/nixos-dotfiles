# This file defines an overlay to pull specific packages from the unstable channel.

{
  # This is a function that takes the inputs from our flake.nix
  inputs, ...
}:

(final: prev: {
  # The packages listed here will be taken from nixpkgs-unstable
  # while the rest of your system remains on the stable channel.

  # Gaming Packages
  steam = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.steam;
  mangohud = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.mangohud;
  # gamemode = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.gamemode;
  # gamescope = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.gamescope;
  # lutris = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.lutris;
  # heroic-games-launcher-bin = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.heroic-games-launcher-bin;

  # Wayland/Hyprland - These often benefit from being on the latest version
  hyprland = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.hyprland;
  waybar = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.waybar;
  ags = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.ags;

  # Modern CLI tools
  zellij = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.zellij;
  eza = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.eza;
  mako = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.mako;

})
