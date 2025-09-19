# This module contains packages for your development environment.

{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Languages and Toolchains
    nodejs_24
    python3
    rustc
    rustup
    gcc 
    go
    lazygit
    jq
    opencode
    gemini-cli
    rainfrog
    hoppscotch
    uv
  ];

}
