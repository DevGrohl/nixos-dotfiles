# This file manages your user-specific configuration using Home Manager.

{
  config,
  pkgs,
  ...
}: {
  # Set the state version for Home Manager
  home.stateVersion = "24.05";

  # --- PACKAGES ---
  # All your personal applications go here.
  home.packages = with pkgs; [
    # Your original packages
    ags_1
    fzf
    gemini-cli
    thunderbird
    discord
    alacritty
    nvtopPackages.full
    btop
    duf
    cliphist
    mako
    eza
    ripgrep
    pulsemixer
    rofi
    zellij

    # Add any other user-specific packages here
  ];

  # --- PROGRAM CONFIGURATION ---
  # Use Home Manager to declaratively configure your programs.

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    # You can add plugins and further config here
  };

  programs.firefox = {
    enable = true;
    # You can configure firefox settings and extensions here
  };

  programs.zsh = {
    enable = true;
    # The shellAliases will be added back in a later step.
    # shellAliases = {
    #   ll = "eza -l";
    #   la = "eza -la";
    #   update = "sudo nixos-rebuild switch";
    # };
  };

  # Example for Alacritty - you can move your config here
  programs.alacritty = {
    enable = true;
    # settings = {
    #   window.opacity = 0.9;
    #   font.normal.family = "FiraCode Nerd Font";
    # };
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
