{ pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  security.sudo.wheelNeedsPassword = false;

  time.timeZone = "America/Los_Angeles";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.journald.extraConfig = ''
    Storage=persistent
  '';

  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    jq
    ripgrep
    btop
    tmux
  ];

  boot.supportedFilesystems.zfs = pkgs.lib.mkForce false;
}
