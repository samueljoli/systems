{ ... }:
{
  services.netdata = {
    enable = true;
    # ponytail: localhost-only. Reach it via `ssh -L 19999:localhost:19999 tpi-node1`
    # or expose on the tailscale interface later.
    config.web."bind to" = "127.0.0.1";
  };
}
