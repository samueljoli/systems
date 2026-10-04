{
  pkgs,
  inputs,
  system,
  username,
  ...
}:
{
  system.stateVersion = 5;

  system.primaryUser = username;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  system.defaults.menuExtraClock.Show24Hour = true;

  system.defaults.NSGlobalDomain.InitialKeyRepeat = 10; # Fastest supported delay before key repeat starts.

  system.defaults.NSGlobalDomain.KeyRepeat = 1; # Fastest supported key repeat rate.

  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false; # Prefer key repeat over accent popovers.

  system.defaults.NSGlobalDomain."com.apple.swipescrolldirection" = false; # Disable natural scrolling.

  system.defaults.dock.wvous-tl-corner = 2; # Hot corner action for top left corner → Mission Control

  system.defaults.".GlobalPreferences"."com.apple.mouse.scaling" = 2.0; # Sets the mouse tracking speed

  system.defaults.NSGlobalDomain."com.apple.trackpad.scaling" = 2.0; # Configures the trackpad tracking speed

  # system.defaults.dock
  time.timeZone = "America/New_York";

  # Add ability to used TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  environment.shells = [ pkgs.zsh ];

  environment.systemPackages = with pkgs; [
    home-manager
  ];

  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
    nerd-fonts.droid-sans-mono
    nerd-fonts.roboto-mono
    # font-awesome
  ];

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = system;
}
