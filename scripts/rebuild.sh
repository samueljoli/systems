#!/usr/bin/env bash

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
    exec darwin-rebuild switch --flake .
    ;;
  home)
    exec home-manager switch --flake .
    ;;
  *)
    echo "Error: Unknown subcommand '$subcommand'"
    usage
    ;;
esac

