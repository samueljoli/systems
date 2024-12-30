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

  system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = 2.0; # Sets the mouse tracking speed

  system.defaults.NSGlobalDomain."com.apple.trackpad.scaling" = 2.0; # Configures the trackpad tracking speed

  # system.defaults.dock
  time.timeZone = "America/New_York";

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

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

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;
}
