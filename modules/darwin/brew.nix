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

  homebrew.casks = [

    "tailscale"

    "shortcat"

    "docker"

    "1password"

    "tableplus"

    "zen-browser"

    "little-snitch"

    "micro-snitch"

    "charles"

    "shottr"
  ];
}
