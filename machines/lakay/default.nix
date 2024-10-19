{ inputs, username, system, ...}:
rec {
  name = "Samuels-MacBook-Air-2";
  darwinConfiguration = 
    inputs:
    inputs.nix-darwin.lib.darwinSystem {
      modules = [
        inputs.nix-homebrew.darwinModules.nix-homebrew
        inputs.home-manager.darwinModules.home-manager
        ./darwin-configuration.nix
        ../../modules/darwin/default.nix
      ];
      specialArgs = {
        inherit inputs;
        username = username;
        system = system;
      };
    };
  homeConfiguration =
    inputs:
    inputs.home-manager.lib.homeManagerConfiguration rec {
      pkgs = inputs.nixpkgs.legacyPackages.${system};

      modules = [
        ../../modules/home-manager/default.nix
      ];

      extraSpecialArgs = {
        inherit inputs;
        inherit username;
        inherit system;
      };
    };
}
