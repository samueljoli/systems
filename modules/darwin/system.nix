{
  pkgs,
  inputs,
  system,
  ...
}:
{
  system.stateVersion = 5;

  system.activationScripts.postUserActivation.text = ''
    # activateSettings -u will reload the settings from the database and apply them to the current session,
    # so we do not need to logout and login again to make the changes take effect.
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  system.defaults.menuExtraClock.Show24Hour = true;

  system.defaults.NSGlobalDomain.InitialKeyRepeat = 10; # How long you must hold down the key before it starts repeating.

  system.defaults.NSGlobalDomain.KeyRepeat = 1; # How fast it repeats once it starts.

  system.defaults.dock.wvous-tl-corner = 2; # Hot corner action for top left corner → Mission Control

  # system.defaults.dock
  time.timeZone = "America/New_York";

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  environment.loginShell = "${pkgs.zsh}/bin/zsh";

  environment.shells = [ pkgs.zsh ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  fonts.packages = with pkgs; [
    roboto-mono
    font-awesome
    nerdfonts
  ];

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # If you have no intention of upgrading to macOS Sequoia 15, or already
  # have a custom UID range that you know is compatible with Sequoia, you
  # can disable this check by setting:
  ids.uids.nixbld = 300;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;
}
