{ pkgs, username, ... }:
{
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];

    # Recovery login for the serial console. The account is otherwise SSH-key
    # only (see ssh.nix), which means no way to log in over UART during
    # recovery. Generate with: `mkpasswd -m sha-512` and paste the hash here.
    # Until this is set, the serial getty shows a prompt but no login succeeds.
    # hashedPassword = "$6$...";
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
