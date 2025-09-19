# This file contains system-wide settings that are not host-specific.

{
  config,
  pkgs,
  lib,
  ...
}: {
  # Use latest kernel (from your stable channel).
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable bluetooth
  hardware.bluetooth.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Allow unfree packages (needed for NVIDIA, Steam, etc.)
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];

  # Enable flatpak (Steam Link)
  services.flatpak.enable = true;

  # --- SERVICES ---
  # Enable the X11 windowing system and desktop environments.
  services.xserver = {
    enable = true;
    # Configure keymap in X11
    xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # Good for music production software
  };

  # Enable printing
  services.printing.enable = true;

  # --- VIRTUALISATION ---
  virtualisation.docker.enable = true;

  # --- USERS ---
  users.users.devgrohl = {
    isNormalUser = true;
    description = "DevGrohl";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    initialPassword = "redkoi0.";
    shell = pkgs.zsh;
  };

  # --- PROGRAMS ---
  # Enable system-wide programs. User-specific ones are in home.nix
  programs.zsh.enable = true;
  programs.firefox.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # --- FONTS ---
  fonts.packages = with pkgs; [
    font-awesome
    fira-code
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.hack
    nerd-fonts._0xproto
    noto-fonts-emoji
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [ "Noto Serif" ];
      sansSerif = [ "Noto Sans" ];
      monospace = [ "Fira Code" ];
    };
    hinting = {
      enable = true;
      style = "full";
    };
  };

  # --- BASE SYSTEM PACKAGES ---
  # Most of your packages should be in home.nix. Only put essential
  # system-level tools here.
  environment.systemPackages = with pkgs; [
    corectrl
    bibata-cursors
    git
    neovim
    wget
    wl-clipboard-rs # For wayland clipboard support
    grimblast
    grim
    slurp
    swappy
    hyprlock
    hyprpaper
    pavucontrol
    pamixer
    playerctl
    easyeffects
    libnotify
    blueman
    bc
    unzip
  ];

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
  };
}
