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

    # Packages for Zsh plugins
    # zsh-completions
    # zsh-you-should-use

    # Add any other user-specific packages here
  ];

  # --- PROGRAM CONFIGURATION ---
  # Use Home Manager to declaratively configure your programs.

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;      # For zsh-autosuggestions plugin
    syntaxHighlighting.enable = true; # For zsh-syntax-highlighting plugin

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "docker"
        "archlinux"
        "z"
      ];
    };

    shellAliases = {
      v = "nvim";
      conf_zsh = "v ~/nixos-config/modules/home.nix"; # Updated to point to new config
      conf_ohmyzsh = "v ~/nixos-config/modules/home.nix"; # Updated to point to new config
      ls = "eza";
      duf = "duf -hide special";
      "." = "cd ..";
      ".." = "cd ../..";
      "..." = "cd ../../..";
      "...." = "cd ../../../..";
      "....." = "cd ../../../../..";
      dcpsa = "docker container ps -a";
      dcbw = "docker compose up --build --watch";
      dcdv = "docker compose down -v";
      hgrep = "history | grep";
      la = "ls -a";
      llah = "ls -lah";
      ":q" = "exit";
    };
  };

  # Declarative Starship prompt configuration
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Declarative FZF configuration
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    # You can add plugins and further config here
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
