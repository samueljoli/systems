{ ... }:
{
  services.tailscale.enable = true;
  # ponytail: run `sudo tailscale up --ssh` interactively on first boot.
  # Move to services.tailscale.authKeyFile + secrets management when zero-touch is needed.
}
