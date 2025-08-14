{ inputs, pkgs }:
{
  enable = true;
  package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  extraLuaConfig = ''
    ${builtins.readFile ./options.lua}
    ${builtins.readFile ./keymaps.lua}
    ${builtins.readFile ./lsp.lua}
    ${builtins.readFile ./cyberpunk.lua}
    ${builtins.readFile ./tokyo_night.lua}
    ${builtins.readFile ./treesitter.lua}
    ${builtins.readFile ./hop.lua}
    ${builtins.readFile ./telescope.lua}
    ${builtins.readFile ./yazi.lua}
    ${builtins.readFile ./comment.lua}
    ${builtins.readFile ./gitsigns.lua}
    ${builtins.readFile ./colorizer.lua}
    ${builtins.readFile ./heirline.lua}
    ${builtins.readFile ./lazydev.lua}
    ${builtins.readFile ./conform.lua}
    ${builtins.readFile ./grug.lua}
    ${builtins.readFile ./tint.lua}
    ${builtins.readFile ./statuscolumn.lua}
    ${builtins.readFile ./rustaceanvim.lua}
    ${builtins.readFile ./barbar.lua}
    ${builtins.readFile ./crates.lua}
    ${builtins.readFile ./neotest.lua}
    ${builtins.readFile ./blink.lua}
    ${builtins.readFile ./claude.lua}
    ${builtins.readFile ./todo-comments.lua}
  '';

  plugins = import ./plugins/default.nix { inherit pkgs; };

  extraLuaPackages = ps: [ ps.jsregexp ];
}
