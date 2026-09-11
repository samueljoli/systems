{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ]; # enable flakes globally

  nix.package = pkgs.nix;

  # aarch64-linux build capability for the Turing Pi CM4 images.
  # This Mac is aarch64-darwin and cannot build Linux derivations natively;
  # the linux-builder runs a lightweight NixOS VM via Apple Virtualization
  # (system-feature `apple-virt`) that builds aarch64-linux at native speed.
  # Sized for compiling the Raspberry Pi vendor kernel from source, which is
  # not in the binary cache.
  nix.linux-builder = {
    enable = true;
    ephemeral = false; # persist the VM's nix store so the RPi kernel compiles once
    maxJobs = 4;
    config = {
      virtualisation = {
        cores = 6;
        darwin-builder.memorySize = 8192; # MiB
        darwin-builder.diskSize = 61440; # MiB (~60G, room for a kernel build)
      };
    };
  };

  # The daemon must trust the caller to use the linux-builder.
  nix.settings.trusted-users = [
    "root"
    "@admin"
  ];
}
