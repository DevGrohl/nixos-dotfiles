# This file manages your user-specific configuration using Home Manager.

{
  config,
  pkgs,
  system,
  inputs,
  ...
}: {
  # Set the state version for Home Manager
  home.stateVersion = "24.05";

  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser.enable = true;

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
    clipman
    cliphist
    mako
    eza
    ripgrep
    pulsemixer
    rofi
    zellij
    waybar
    wlogout
    envsubst
    superfile
    spotify
    clapper
    transmission_4-qt6
    obsidian
    nodejs
  ];

  programs.zsh.initExtra = ''
    export PATH="${config.home.homeDirectory}/.npm-global/bin:$PATH"
  '';

  home.activation = {
    installAuggie = ''
      export NPM_CONFIG_PREFIX="${config.home.homeDirectory}/.npm-global"
      $DRY_RUN_CMD ${pkgs.nodejs}/bin/npm install -g @augmentcode/auggie
    '';
  };

  services.cliphist = {
    enable = true;
    systemdTarget = "graphical-session.target";
  };
  

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
  };

  # Let Home Manager manage itself
  programs.home-manager.enable = true;
}
