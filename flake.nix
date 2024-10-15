{
  description = "Flake for nix darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
  };

  outputs =
    inputs:
    let
      # Returns an iterable of sets w/ keys: [name, darwinConfiguration]
      machines = import ./machines {
        inherit inputs;
        userName = "sjoli";
      };
    in
    # Returns an attribute set representing output
    machines.forEach (machine: {
      darwinConfigurations.${machine.name} = machine.darwinConfiguration inputs;
      # homeConfigurations.${machine.name} = machine.homeConfiguration inputs;
    });
}
