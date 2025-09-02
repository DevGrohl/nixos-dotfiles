# This module contains packages for your development environment.

{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Languages and Toolchains
    nodejs_24
    python3Full
    rustc
    rustup
    gcc 
    go
    lazygit
    jq
  ];
}
