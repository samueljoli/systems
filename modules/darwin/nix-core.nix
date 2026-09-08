{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # enable flakes globally

  nix.package = pkgs.nix;

  # aarch64-linux builder for the turing pi nixos images.
  # First `rebuild` boots a NixOS VM; subsequent aarch64-linux builds route to it.
  nix.linux-builder.enable = true;
}
