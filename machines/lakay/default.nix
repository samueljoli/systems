{
  inputs,
  username,
  system,
  ...
}:
rec {
  hostname = "lakay-air";
  darwinConfiguration =
    inputs:
    inputs.nix-darwin.lib.darwinSystem {
      modules = [
        inputs.nix-homebrew.darwinModules.nix-homebrew
        inputs.home-manager.darwinModules.home-manager
        ../../modules/darwin/nix-core.nix
        ../../modules/darwin/host-users.nix
        ../../modules/darwin/system.nix
        ../../modules/darwin/brew.nix
      ];
      specialArgs = {
        inherit inputs;
        hostname = hostname;
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
