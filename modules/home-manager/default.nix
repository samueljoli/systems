{
  pkgs,
  inputs,
  username,
  system,
  ...
}:
{
  home = {
    username = username;

    homeDirectory =
      if pkgs.stdenv.isDarwin then
        "/Users/${username}"
      else if pkgs.stdenv.isLinux then
        "/home/${username}"
      else
        throw "What's the home directory for this OS?";

    stateVersion = "23.11";

    packages = import ./packages { inherit pkgs; } ++ [
      inputs.baouncer.packages.${system}.default
    ];
  };

  nixpkgs = {
    overlays = [
      inputs.claude-code.overlays.default
      inputs.neovim-nightly-overlay.overlays.default
    ];
    config = {
      allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [ "claude-code" ];
    };
  };

  programs = import ./programs {
    inherit pkgs;
    inherit inputs;
    inherit system;
  };

  home.file = {
    ".config/ghostty/config".source = ./programs/ghostty/config;
  };
}
