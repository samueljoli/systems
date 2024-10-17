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
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      rebuild = pkgs.writeShellScriptBin "rebuild" (builtins.readFile ./scripts/rebuild.sh);
      userName = "sjoli";
      system = "aarch64-darwin";
      pkgs = import inputs.nixpkgs { inherit system; };

      machines = import ./machines {
        inherit inputs;
        inherit userName;
      };
    in
    machines.forEach (machine: {
      darwinConfigurations.${machine.name} = machine.darwinConfiguration inputs;
      homeConfigurations.${userName} = machine.homeConfiguration inputs;
    }) // {
      devShells.${system}.default = pkgs.mkShell { packages = with pkgs; [rebuild]; };
    };
}
