{ pkgs }:

let
  buildTools = with pkgs; [
    lld
    ffmpeg
    yt-dlp
  ];

  gitTools = (
    with pkgs;
    [
      difftastic
      gh
      diff-so-fancy
    ]
  );

  infraTools = with pkgs; [
    awscli2
    # tailscale
    flyctl
  ];

  nixTools = with pkgs; [
    devenv
    fh
    flake-checker
    nixfmt
    nixpkgs-fmt
    nix-prefetch-github
  ];

  toys = with pkgs; [
    tpi
    bat
    fzf
    oha
    ripgrep
    ast-grep
    yazi
    copier
    claude-code
  ];
in
infraTools ++ gitTools ++ nixTools ++ toys ++ buildTools
