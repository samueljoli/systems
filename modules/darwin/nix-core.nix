{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # enable flakes globally

  nix.package = pkgs.nix;
}
