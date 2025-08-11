{ pkgs }:

let
  buildTools = with pkgs; [
    lld
  ];

  gitTools = (
    with pkgs;
    [
      difftastic
      gh
    ]
    ++ (with gitAndTools; [
      diff-so-fancy
    ])
  );

  infraTools = with pkgs; [
    awscli2
    tailscale
  ];

  nixTools = with pkgs; [
    devenv
    fh
    flake-checker
    nixfmt-rfc-style
    nixpkgs-fmt
    nix-prefetch-github
  ];

  toys = with pkgs; [
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
