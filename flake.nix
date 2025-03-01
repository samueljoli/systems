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
    nil = {
      url = "github:oxalica/nil/c8e8ce72442a164d89d3fdeaae0bcc405f8c015a";
      flake = true;
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };
    baouncer = {
      url = "github:lalilul3lo/baouncer";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      username = "sjoli";
      system = "aarch64-darwin";
      rebuild = pkgs.writeShellScriptBin "rebuild" (builtins.readFile ./scripts/rebuild.sh);
      pkgs = import inputs.nixpkgs { inherit system; };
      utils = import ./utils { inherit pkgs; };
      nix-lsp-server = inputs.nil.packages.${system}.nil;
      nixfmt-rfc-style = inputs.nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
      machines = import ./machines {
        inherit inputs;
        inherit username;
        inherit system;
      };

    in
    machines.forEach (machine: {
      darwinConfigurations.${machine.hostname} = machine.darwinConfiguration inputs;
      homeConfigurations.${username} = machine.homeConfiguration inputs;
    })
    // {
      # expose rebuild script in this environment
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          rebuild
          nix-lsp-server
          nixfmt-rfc-style
          pkgs.lua-language-server
          # For scripting with node
          pkgs.nodejs_23
          pkgs.typescript
          pkgs.typescript-language-server
        ];
      };

      apps.${system} = machines.forEach utils.generateApp;

      formatter.${system} = nixfmt-rfc-style;
    };
}
