{ pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];

    # Serial-console recovery login. The account is otherwise SSH-key only
    # (see ssh.nix); the console password is managed via sops-nix once the node
    # is registered (see secrets.nix). Until then the serial getty shows a
    # prompt but only SSH-key login works. For an optional day-0 console login
    # before sops is active, set initialHashedPassword here (physical-access
    # only; safe-ish to commit, but prefer the sops path).
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
