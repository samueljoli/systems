{ inputs, userName, ...}:
rec {
  name = "Samuels-MacBook-Air-2";
  platform = "aarch64-darwin";
  darwinConfiguration = 
    inputs:
    inputs.nix-darwin.lib.darwinSystem {
      # inherit platform;
      modules = [
        inputs.nix-homebrew.darwinModules.nix-homebrew
        inputs.home-manager.darwinModules.home-manager
        ./darwin-configuration.nix
        ../common/darwin.nix
      ];
      specialArgs = {
        inherit inputs;
        userName = userName;
        platform = platform;
      };
    };
  homeConfiguration =
    inputs:
    inputs.home-manager.lib.homeManagerConfiguration rec {
      pkgs = inputs.nixpkgs.legacyPackages.${platform};

      modules = [
        ../../modules/home-manager/default.nix
      ];

      extraSpecialArgs = {
        inherit inputs;
        inherit userName;
        inherit platform;
      };
    };
}
