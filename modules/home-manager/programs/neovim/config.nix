{ inputs, pkgs, ... }:
let
  common = import ./shared.nix { inherit inputs pkgs; };
in
{
  neovim = common.package;
  initLua = common.initLua;
  plugins.start = common.plugins;
  inherit (common) extraBinPath extraLuaPackages;

  providers = {
    nodeJs.enable = true;
    python3.enable = true;
    ruby.enable = true;
  };
}
