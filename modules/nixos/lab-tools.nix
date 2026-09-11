{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tcpdump
    iperf3
    ethtool
    inetutils
    dnsutils
    socat
    stress-ng
    sysstat
    fio
  ];
}
