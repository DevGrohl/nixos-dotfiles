{
  description = "DevGrohl's NixOS Flake";

  inputs = {
    # Your primary, unstable package source
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager for managing user-level packages and dotfiles
    home-manager = {
      url = "github:nix-community/home-manager";
      # Make Home Manager follow the unstable channel
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # Pass all inputs to modules
        modules = [
          ./configuration.nix

          # Your user configuration
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "bckp";
            home-manager.users.devgrohl = import ./modules/home.nix;
          }
        ];
      };
    };
  };
}
