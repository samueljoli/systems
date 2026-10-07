# List all available just commands.
default:
    @just --list

# List all machines defined by the flake.
machines:
  @nix eval --json .#darwinConfigurations --apply builtins.attrNames

# Rebuild and activate the nix-darwin system configuration.
system:
  sudo rebuild system

# Rebuild and activate the Home Manager user configuration.
home:
  rebuild home

# Update one flake input, for example: just update-input nixpkgs.
update-input input:
  nix flake lock --update-input {{input}}

# Prefetch a Vim package, for example: just prefetch_vim telescope.nvim.
prefetch_vim pkg:
  vim_pkg {{pkg}}

