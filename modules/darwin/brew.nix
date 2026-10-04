{
  inputs,
  username,
  ...
}:
{
  nix-homebrew.enable = true;

  nix-homebrew.user = username;

  nix-homebrew.enableRosetta = true;

  nix-homebrew.taps."homebrew/homebrew-core" = inputs.homebrew-core;

  nix-homebrew.taps."homebrew/homebrew-cask" = inputs.homebrew-cask;

  nix-homebrew.taps."homebrew/homebrew-bundle" = inputs.homebrew-bundle;

  nix-homebrew.mutableTaps = false; # taps can no longer be added imperatively with `brew tap`.

  homebrew.enable = true;

  homebrew.brews = [
    "libusb"
    "pkg-config"
  ];

  homebrew.casks = [
    "1password"
    "charles"
    "codex"
    "docker"
    "ghostty"
    "little-snitch"
    "lulu"
    "micro-snitch"
    "raycast"
    "shortcat"
    "shottr"
    "tableplus"
    "tailscale"
    "thebrowsercompany-dia"
  ];
}
