#!/usr/bin/env bash
set -e

flake_ref="${SYSTEMS_FLAKE:-github:samueljoli/systems}"

# Build the system configuration
nix build "$flake_ref#darwinConfigurations.@machine@.system" \
  --impure \
  --extra-experimental-features "nix-command flakes"

# Apply the configuration
./result/sw/bin/darwin-rebuild switch --flake "$flake_ref#@machine@"

