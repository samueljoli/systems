{
  inputs,
  pkgs,
  system,
  ...
}:

{
  home-manager = {
    enable = true;
  };

  git = import ./git.nix { inherit pkgs; };

  direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    config = {
      hide_env_diff = true;
    };
  };

  nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    # flake = "/home/user/my-nixos-config"; # sets NH_OS_FLAKE variable for you
  };

  neovim = import ./neovim/default.nix {
    inherit pkgs;
    inherit inputs;
  };

  starship = import ./starship.nix { inherit pkgs; };

  zed-editor = import ./zed/default.nix {
    inherit pkgs;
    inherit inputs;
    inherit system;
  };

  zsh = import ./zsh/default.nix { inherit pkgs; };

  zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
