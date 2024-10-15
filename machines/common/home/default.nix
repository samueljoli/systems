{
  config,
  pkgs,
  inputs,
  userName,
  lib,
  ...
}:
{
  home = {
    username = userName;

    homeDirectory =
      if pkgs.stdenv.isDarwin then
        "/Users/${userName}"
      else if pkgs.stdenv.isLinux then
        "/home/${userName}"
      else
        throw "What's the home directory for this OS?";

    stateVersion = "23.11";

    packages = import ./packages { inherit pkgs; } ++ [
      # inputs.baouncer.packages.${system}.default
    ];

    programs = import ./programs {
      inherit pkgs;
      inherit inputs;
    };
  };
}
