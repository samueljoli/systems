{
  inputs,
  username,
  system,
  ...
}:
rec {
  hostname = "lakay-air";
  isDarwin = true;
  mkOutputs = inputs: {
    darwinConfigurations.${hostname} = inputs.nix-darwin.lib.darwinSystem {
      modules = [
        inputs.nix-homebrew.darwinModules.nix-homebrew
        inputs.home-manager.darwinModules.home-manager
        ../../modules/darwin/nix-core.nix
        ../../modules/darwin/host-users.nix
        ../../modules/darwin/system.nix
        ../../modules/darwin/brew.nix
        ../../modules/darwin/services/default.nix
      ];
      specialArgs = {
        inherit inputs;
        hostname = hostname;
        username = username;
        system = system;
      };
    };
    homeConfigurations.${username} = inputs.home-manager.lib.homeManagerConfiguration {
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
  };
}
