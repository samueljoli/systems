{
  config,
  pkgs,
  inputs,
  userName,
  platform,
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
      inputs.baouncer.packages.${platform}.default
    ];
  };

  nixpkgs = {
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          foreign-vim-kitty = prev.vimUtils.buildVimPlugin {
            name = "kitty";
            src = inputs.plugin-vim-kitty;
          };
          foreign-statuscolumn-nvim = prev.vimUtils.buildVimPlugin {
            name = "statuscolumn";
            src = inputs.plugin-statuscolumn-nvim;
          };
          foreign-dir-telescope = prev.vimUtils.buildVimPlugin {
            name = "dir-telescope";
            src = inputs.plugin-dir-telescope;
          };
          foreign-grug-nvim = prev.vimUtils.buildVimPlugin {
            name = "grug";
            src = inputs.plugin-grug-nvim;
          };
          foreign-tint-nvim = prev.vimUtils.buildVimPlugin {
            name = "tint-nvim";
            src = inputs.plugin-tint-nvim;
          };
          foreign-yazi-nvim = prev.vimUtils.buildVimPlugin {
            name = "yazi";
            src = inputs.plugin-yazi-nvim;
          };
          foreign-cyberpunk-nvim = prev.vimUtils.buildVimPlugin {
            name = "cyberpunk";
            src = inputs.plugin-cyberpunk-nvim;
          };
          foreign-gruvbox-nvim = prev.vimUtils.buildVimPlugin {
            name = "gruvbox";
            src = inputs.plugin-gruvbox-nvim;
          };
          foreign-heirline-components = prev.vimUtils.buildVimPlugin {
            name = "heirline-components";
            src = inputs.plugin-heirline-components;
          };
          foreign-lazydev-nvim = prev.vimUtils.buildVimPlugin {
            name = "lazydev";
            src = inputs.plugin-lazydev-nvim;
          };
          foreign-luvit-meta = prev.vimUtils.buildVimPlugin {
            name = "luvit-meta";
            src = inputs.plugin-luvit-meta;
          };
        };
      })
    ];
  };

  programs = import ./programs {
    inherit pkgs;
    inherit inputs;
  };

  home.file = {
    ".config/kitty/get_layout.py".source = ./programs/kitty/get_layout.py;
    ".config/kitty/pass_keys.py".source = ./programs/kitty/pass_keys.py;
  };
}
