{ inputs, pkgs }:
let
  crates-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "crates-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "saecki";
      repo = "crates.nvim";
      rev = "1803c8b5516610ba7cdb759a4472a78414ee6cd4";
      sha256 = "sha256-xuRth8gfX6ZTV3AUBaTM9VJr7ulsNFxtKEsFDZduDC8=";
    };
  };
  dir-telescope = pkgs.vimUtils.buildVimPlugin {
    name = "dir-telescope";
    src = pkgs.fetchFromGitHub {
      owner = "princejoogie";
      repo = "dir-telescope.nvim";
      rev = "805405b9f98dc3470f8676773dc0e6151a9158ed";
      sha256 = "sha256-B/cZUkjAVi52jopBwZJYmiaVf8PqnawusnSGOx7dDqs=";
    };
  };
  yazi-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "yazi-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "mikavilpas";
      repo = "yazi.nvim";
      rev = "0c70a0833ed79863758d01d6e9af2d7765b1c68c";
      sha256 = "sha256-d2mxbTFs8ixvSu3IfK7MfK82Sx0iQf+JW1eX1Yfknjo=";
    };
  };
  heirline-components-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "heirline-components-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "Zeioth";
      repo = "heirline-components.nvim";
      rev = "935f29dabd86f2669e0b3c8dd283b2d3b1cfaee7";
      sha256 = "sha256-M2muEW4RFQxdaJjZaXMXosy0M7Zj4MlbITRpRWpinwo=";
    };
  };
  grug-far-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "grum-far-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "MagicDuck";
      repo = "grug-far.nvim";
      rev = "309ecac6e6240d37c0be3c567d9f7cc95f63d255";
      sha256 = "sha256-WdKCIOyQAbiFX9ln09c5isoCXtjDbipyR3u0Y6/AP40=";
    };
  };
  pest-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "pest-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "pest-parser";
      repo = "pest.nvim";
      rev = "7cfcb43f824e74d13dfe631359fff2ec23836a77";
      sha256 = "sha256-EQcMSsKWtQvr0eQ6Hn0TtDA5Nc7VV0g2bnbx7i2B7u4=";
    };
  };
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
    ${builtins.readFile ./neotest.lua}
  '';

  plugins = with pkgs.vimPlugins; [
    barbar-nvim
    cmp-nvim-lsp
    cmp-nvim-lsp
    cmp-path
    cmp_luasnip
    comment-nvim
    conform-nvim
    fidget-nvim
    crates-nvim
    yazi-nvim
    foreign-cyberpunk-nvim
    dir-telescope
    grug-far-nvim
    foreign-lazydev-nvim
    foreign-luvit-meta
    pest-nvim
    foreign-statuscolumn-nvim
    foreign-tint-nvim
    friendly-snippets
    gitsigns-nvim
    heirline-components-nvim
    heirline-nvim
    hop-nvim
    luasnip
    mason-lspconfig-nvim
    mason-nvim
    mason-tool-installer-nvim
    neotest
    nvim-nio
    FixCursorHold-nvim
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
