{ pkgs, ... }:

{
  nix.settings.experimental-features = ["nix-command" "flakes"]; # enable flakes globally

  nix.package = pkgs.nix;

  services.nix-daemon.enable = true; # Auto upgrade nix package and the daemon service.
}
