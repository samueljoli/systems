{pkgs, inputs, userName, ...}:
{
  nix-homebrew = {
    enable = true;

    enableRosetta = true;

    user = userName;

    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
    };

    # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    casks = [
      "tailscale"
      "shortcat"
      "docker"
      "1password"
      # "arc"
      "tableplus"
      # "postman"
    ];
  };
}
