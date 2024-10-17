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
      system = "aarch64-darwin";
      pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          (final: prev: {
            rebuild = final.writeShellScriptBin "rebuild" ''
              #!${final.bash}/bin/bash

              set -euo pipefail

              usage() {
                echo "Usage: rebuild [system|home|all] [--options]"
                exit 1
              }

              if [ $# -lt 1 ]; then
                usage
              fi

              subcommand="$1"
              shift

              case "$subcommand" in
                system)
                  exec darwin-rebuild switch --flake ${inputs.self}
                  ;;
                home)
                  exec home-manager switch --flake ${inputs.self}
                  ;;
                *)
                  echo "Error: Unknown subcommand '$subcommand'"
                  usage
                  ;;
              esac
            '';
          })
        ];
      };

      userName = "sjoli";

      machines = import ./machines {
        inherit inputs;
        inherit userName;
      };
    in
    machines.forEach (machine: {
      darwinConfigurations.${machine.name} = machine.darwinConfiguration inputs;
      homeConfigurations.${userName} = machine.homeConfiguration inputs;
    }) // {
      packages.${system} = rec {
        inherit (pkgs) rebuild;
      };
    };
}
