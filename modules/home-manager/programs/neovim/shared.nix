{ inputs, pkgs, ... }:
let
  achitek-ls = pkgs.runCommand "achitek-ls" { } ''
    mkdir -p $out/bin
    ln -s ${
      inputs.achitek.packages.${pkgs.stdenv.hostPlatform.system}.default
    }/bin/achitek $out/bin/achitek-ls
  '';

  luaFiles = map (name: ./. + "/${name}") [
    "rustaceanvim.lua"
    "options.lua"
    "keymaps.lua"
    "lsp.lua"
    "achitek.lua"
    "octo.lua"
    "cyberpunk.lua"
    "tokyo_night.lua"
    "treesitter.lua"
    "hop.lua"
    "telescope.lua"
    "yazi.lua"
    "comment.lua"
    "gitsigns.lua"
    "colorizer.lua"
    "autopairs.lua"
    "cmp.lua"
    "heirline.lua"
    "lazydev.lua"
    "conform.lua"
    "grug.lua"
    "tint.lua"
    "statuscolumn.lua"
    "barbar.lua"
    "crates.lua"
    "neotest.lua"
    "claude.lua"
    "todo-comments.lua"
  ];
in
{
  inherit luaFiles;

  initLua = builtins.concatStringsSep "\n" (map builtins.readFile luaFiles);
  package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
  plugins = import ./plugins/default.nix { inherit inputs pkgs; };
  extraLuaPackages = ps: [ ps.jsregexp ];

  extraBinPath = with pkgs; [
    achitek-ls
    fd
    fzf
    gh
    lua-language-server
    nil
    nixfmt
    pest-ide-tools
    pyright
    ripgrep
    rust-analyzer
    stylua
    typescript
    typescript-language-server
    yazi
  ];
}
