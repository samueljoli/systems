#!/usr/bin/env bash
set -e

# Build the system configuration
nix build .#darwinConfigurations.@machine@.system --impure --extra-experimental-features "nix-command flakes"

# Apply the configuration
./result/sw/bin/darwin-rebuild switch --flake .#@machine@

