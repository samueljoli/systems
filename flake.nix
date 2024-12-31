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
      url = "github:nix-community/neovim-nightly-overlay/f35afbe60a4ff71fd65fec3839fc38943f961951";
    };
    plugin-statuscolumn-nvim = {
      url = "github:JuanBaut/statuscolumn.nvim";
      flake = false;
    };
    plugin-tint-nvim = {
      url = "github:levouh/tint.nvim";
      flake = false;
    };
    plugin-cyberpunk-nvim = {
      url = "github:samueljoli/cyberpunk.nvim";
      flake = false;
    };
    plugin-grug-nvim = {
      url = "github:MagicDuck/grug-far.nvim";
      flake = false;
    };
    plugin-gruvbox-nvim = {
      url = "github:ellisonleao/gruvbox.nvim";
      flake = false;
    };
    plugin-yazi-nvim = {
      url = "github:mikavilpas/yazi.nvim";
      flake = false;
    };
    plugin-heirline-components = {
      url = "github:Zeioth/heirline-components.nvim/f849bbfe05f0d523449eb8d0713dffd4c3d7c295";
      flake = false;
    };
    plugin-lazydev-nvim = {
      url = "github:folke/lazydev.nvim";
      flake = false;
    };
    plugin-luvit-meta = {
      url = "github:Bilal2453/luvit-meta";
      flake = false;
    };
    plugin-dir-telescope = {
      url = "github:princejoogie/dir-telescope.nvim";
      flake = false;
    };
    baouncer = {
      url = "github:lalilul3lo/baouncer";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plugin-pest-vim = {
      url = "github:pest-parser/pest.vim";
      flake = false;
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
        ];
      };

      apps.${system} = machines.forEach utils.generateApp;

      formatter.${system} = nixfmt-rfc-style;
    };
}
