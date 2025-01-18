{ inputs, pkgs }:

let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
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
    ${builtins.readFile ./autopairs.lua}
    ${builtins.readFile ./heirline.lua}
    ${builtins.readFile ./lazydev.lua}
    ${builtins.readFile ./conform.lua}
    ${builtins.readFile ./cmp.lua}
    ${builtins.readFile ./grug.lua}
    ${builtins.readFile ./tint.lua}
    ${builtins.readFile ./statuscolumn.lua}
    ${builtins.readFile ./rustaceanvim.lua}
    ${builtins.readFile ./barbar.lua}
    ${builtins.readFile ./crates.lua}
  '';

  plugins = with pkgs.vimPlugins; [
    barbar-nvim
    cmp-nvim-lsp
    cmp-nvim-lsp
    cmp-path
    cmp_luasnip
    comment-nvim
    conform-nvim
    crates-nvim
    fidget-nvim
    foreign-cyberpunk-nvim
    foreign-dir-telescope
    foreign-grug-nvim
    foreign-heirline-components
    foreign-lazydev-nvim
    foreign-luvit-meta
    foreign-pest-vim
    foreign-statuscolumn-nvim
    foreign-tint-nvim
    foreign-yazi-nvim
    friendly-snippets
    gitsigns-nvim
    heirline-nvim
    hop-nvim
    luasnip
    mason-lspconfig-nvim
    mason-nvim
    mason-tool-installer-nvim
    nvim-autopairs
    nvim-cmp
    nvim-colorizer-lua
    nvim-lspconfig
    nvim-treesitter-context
    nvim-treesitter-textobjects
    nvim-treesitter.withAllGrammars
    nvim-web-devicons
    plenary-nvim
    rustaceanvim
    telescope-fzf-native-nvim
    telescope-nvim
    telescope-ui-select-nvim
    tokyonight-nvim
    typescript-tools-nvim
    vim-fugitive
    vim-nix
    vim-rhubarb
  ];

  extraLuaPackages = ps: [ ps.jsregexp ];
}
