{
  description = "Flake for nix darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
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
    kopye = {
      url = "github:lalilul3lo/kopye";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    achitek = {
      url = "github:achitek-org/achitek";
    };
    claude-code = {
      url = "github:sadjow/claude-code-nix/faa8786775fa232366f95a6f8dc2de67a1fea0e5";
    };
    tree-sitter-achitek = {
      url = "github:achitek-org/tree-sitter-achitek";
      flake = false;
    };
  };

  outputs =
    inputs:
    let
      username = "sjoli";
      system = "aarch64-darwin";
      rebuild = pkgs.writeShellScriptBin "rebuild" (builtins.readFile ./scripts/rebuild.sh);
      vim_pkg = pkgs.writeShellScriptBin "vim_pkg" ''
        #!/usr/bin/env bash
        exec ${pkgs.nodejs_24}/bin/node ${./scripts/prefetch_vim_pkgs.js} "$@"
      '';
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
    machines.forEach (machine: machine.mkOutputs inputs)
    // {
      # expose rebuild script in this environment
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          rebuild
          vim_pkg
          nix-lsp-server
          nixfmt-rfc-style
          pkgs.lua-language-server
          pkgs.just
          # For scripting with node
          pkgs.nodejs_24
          pkgs.typescript
          pkgs.typescript-language-server
        ];
      };

      # bootstrap apps target darwin only; nixos hosts are installed via BMC flash.
      apps.${system} = builtins.foldl' (acc: m: acc // utils.generateApp m) { } machines.darwinHosts;

      formatter.${system} = nixfmt-rfc-style;
    };
}
