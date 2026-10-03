# List available recipes
default:
    @just --list

# Rebuild nix-darwin
system:
  sudo rebuild system

# Rebuild home-manager
home:
  rebuild home

update-input input:
  nix flake lock --update-input {{input}}

# Prefetch vim pkg
prefetch_vim pkg:
  vim_pkg {{pkg}}

