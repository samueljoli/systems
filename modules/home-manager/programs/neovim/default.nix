{ inputs, pkgs }:
let
  common = import ./shared.nix { inherit inputs pkgs; };
in
{
  enable = true;
  inherit (common) package extraLuaPackages;
  defaultEditor = true;
  withRuby = true;
  withPython3 = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  initLua = common.initLua;
  plugins = common.plugins;
}
