{ pkgs, ... }:
let
  crates-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "crates-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "saecki";
      repo = "crates.nvim";
      rev = "1803c8b5516610ba7cdb759a4472a78414ee6cd4";
      sha256 = "sha256-xuRth8gfX6ZTV3AUBaTM9VJr7ulsNFxtKEsFDZduDC8=";
    };
    nvimSkipModules = [
      "crates.null-ls"
    ];
  };
  blink-cmp = pkgs.vimUtils.buildVimPlugin {
    name = "blink.cmp";
    src = pkgs.fetchFromGitHub {
      owner = "Saghen";
      repo = "blink.cmp";
      rev = "af22c527a451d162e5229a1eff9283ee840b4bca";
      sha256 = "sha256-WnXCVNU5if/2pODUNpyMtEssRXgpmGqEhwUAbL9AN1Q=";
    };

    nvimSkipModules = [
      "repro"
      "blink.cmp.fuzzy.rust.init"
    ];
  };
  yazi-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "yazi-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "mikavilpas";
      repo = "yazi.nvim";
      rev = "0c70a0833ed79863758d01d6e9af2d7765b1c68c";
      sha256 = "sha256-d2mxbTFs8ixvSu3IfK7MfK82Sx0iQf+JW1eX1Yfknjo=";
    };
    nvimSkipModules = [
      "repro"
      "yazi.lsp.rename"
      "yazi.lsp.embedded-lsp-file-operations.lsp-file-operations"
      "yazi.lsp.embedded-lsp-file-operations.lsp-file-operations.did-delete"
      "yazi.lsp.embedded-lsp-file-operations.lsp-file-operations.will-delete"
      "yazi.lsp.embedded-lsp-file-operations.lsp-file-operations.did-rename"
      "yazi.lsp.embedded-lsp-file-operations.lsp-file-operations.will-rename"
      "yazi.lsp.embedded-lsp-file-operations.lsp-file-operations.log"
      "yazi.lsp.embedded-lsp-file-operations.lsp-file-operations.utils"
      "yazi.lsp.embedded-lsp-file-operations.lsp-file-operations.did-create"
      "yazi.lsp.embedded-lsp-file-operations.lsp-file-operations.will-create"
      "yazi.lsp.delete"
      "yazi.renameable_buffer"
      "yazi.event_handling.yazi_event_handling"
      "yazi.utils"
      "yazi.buffer_highlighting.yazi_session_highlighter"
      "yazi.keybinding_helpers"
      "yazi.process.ya_process"
      "yazi.process.yazi_process"
    ];
  };
  heirline-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "heirline-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "rebelot";
      repo = "heirline.nvim";
      rev = "af3f441ea10f96105e1af14cd37bf213533812d2";
      sha256 = "sha256-VY7I8K0Phekr3gu+QnNbxKRI+8TUVIx5gWYe1Q7gsuI=";
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
    nvimSkipModules = [
      "heirline-components.core.heirline"
      "heirline-components.core.init"
      "heirline-components.core.env"
      "heirline-components.core.hl"
      "heirline-components.core.component"
      "heirline-components.core.utils"
      "heirline-components.core.provider"
      "heirline-components.core.condition"
    ];
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
  todo-comments-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "todo-comments-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "todo-comments.nvim";
      rev = "304a8d204ee787d2544d8bc23cd38d2f929e7cc5";
      sha256 = "sha256-at9OSBtQqyiDdxKdNn2x6z4k8xrDD90sACKEK7uKNUM=";
    };
    nvimSkipModules = [
      "todo-comments.fzf"
      "trouble.providers.todo"
      "trouble.sources.todo"
    ];
  };
  statuscolumn-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "statuscolumn-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "JuanBaut";
      repo = "statuscolumn.nvim";
      rev = "36cbd5933c7bfe8e6973c5eef445484f29dce6a6";
      sha256 = "sha256-X+vrQHrxMgH3mB7qRQiutp/eAShVEy8aJBGMEm0KQ7U=";
    };
  };
  tint-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "tint-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "levouh";
      repo = "tint.nvim";
      rev = "586e87f00c8b0f5e857cefe10839e41f3e8c6d01";
      sha256 = "sha256-gmtFb/FirvTtWeTpalabWmt5kQiH83rE7gph3VcKcss=";
    };
  };
  cyberpunk-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "cyberpunk-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "samueljoli";
      repo = "cyberpunk.nvim";
      rev = "5a223942c652a866626b97d86d2a611dfbbf4a66";
      sha256 = "sha256-IW+nVYtWdGLgxhuBxGXbxNZlFhNk0a2PpQ5AJCGvDLU=";
    };
  };
  gruvbox-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "gruvbox-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "ellisonleao";
      repo = "gruvbox.nvim";
      rev = "089b60e92aa0a1c6fa76ff527837cd35b6f5ac81";
      sha256 = "sha256-BBMDCIhwTvZQyeWug8zzUwV8uuqQIkpXtEpoErvAKFc=";
    };
  };
  lazydev-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "lazydev-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "lazydev.nvim";
      rev = "2367a6c0a01eb9edb0464731cc0fb61ed9ab9d2c";
      sha256 = "sha256-LoxziiV9jlHuU4vRVFfKtVLI45ouJcuyXC6DIyQKlew=";
    };
  };
  luvit-meta = pkgs.vimUtils.buildVimPlugin {
    name = "luvit-meta";
    src = pkgs.fetchFromGitHub {
      owner = "Bilal2453";
      repo = "luvit-meta";
      rev = "1df30b60b1b4aecfebc785aa98943db6c6989716";
      sha256 = "sha256-n6eD2CayjoKdORN9MQY3RFJEE9cOUITypV3lKowiETk=";
    };
  };
  barbar-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "barbar-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "romgrk";
      repo = "barbar.nvim";
      rev = "807bede7ef1d8e2ac5f108e9ac8123b1e2d321e3";
      sha256 = "sha256-RXeuN19snH7queItuxfeh2EeGKW18xsSfA2xVAenrhM=";
    };
    nvimSkipModules = [
      "bufferline.utils"
    ];
  };
  comment-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "comment-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "numToStr";
      repo = "Comment.nvim";
      rev = "e30b7f2008e52442154b66f7c519bfd2f1e32acb";
      sha256 = "sha256-h0kPue5Eqd5aeu4VoLH45pF0DmWWo1d8SnLICSQ63zc=";
    };
  };
  conform-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "conform-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "stevearc";
      repo = "conform.nvim";
      rev = "a6f5bdb78caa305496357d17e962bbc4c0b392e2";
      sha256 = "sha256-H9JLiRtixDKDN50SH6gkqgjlhLzHMAaOT1pc69ZFdco=";
    };
  };
  fidget-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "fidget-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "j-hui";
      repo = "fidget.nvim";
      rev = "d9ba6b7bfe29b3119a610892af67602641da778e";
      sha256 = "sha256-AFUx/ZQVWV7s5Wlppjk6N9QXoJKNKqxtf990FFlTEhw=";
    };
  };
  friendly-snippets = pkgs.vimUtils.buildVimPlugin {
    name = "friendly-snippets";
    src = pkgs.fetchFromGitHub {
      owner = "rafamadriz";
      repo = "friendly-snippets";
      rev = "efff286dd74c22f731cdec26a70b46e5b203c619";
      sha256 = "sha256-I8SRZxnoNC6SOWW+scoA77Jwyxcb4eUczppLdyOiZe0=";
    };
  };
  gitsigns-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "gitsigns-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "lewis6991";
      repo = "gitsigns.nvim";
      rev = "4c40357994f386e72be92a46f41fc1664c84c87d";
      sha256 = "sha256-PIwKEPNAkTiZAr8tncjFakvOWX1D5TOdSiurVZ5AcbQ=";
    };
  };
  hop-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "hop-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "hadronized";
      repo = "hop.nvim";
      rev = "1a1eceafe54b5081eae4cb91c723abd1d450f34b";
      sha256 = "sha256-SnuFeD/lrMxKtpBRPgIwdG0kVF7BWe02PiV7URVDASI=";
    };
  };
  luasnip = pkgs.vimUtils.buildVimPlugin {
    name = "luasnip";
    src = pkgs.fetchFromGitHub {
      owner = "L3MON4D3";
      repo = "LuaSnip";
      rev = "c9b9a22904c97d0eb69ccb9bab76037838326817";
      sha256 = "sha256-3ecm5SDTcSOh256xSQPHhddQfMpepiEIpv58fHXrVg0=";
    };
  };
  mason-lspconfig-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "mason-lspconfig-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "williamboman";
      repo = "mason-lspconfig.nvim";
      rev = "1a31f824b9cd5bc6f342fc29e9a53b60d74af245";
      sha256 = "sha256-+Rji3UH32QQZADqQhMcJpgmkwbDumKaBlZO6cqNvUGY=";
    };
    nvimSkipModules = [
      "mason-lspconfig"
      "mason-lspconfig.install"
      "mason-lspconfig.server_configurations.drools_lsp.init"
      "mason-lspconfig.server_configurations.solang.init"
      "mason-lspconfig.server_configurations.angularls.init"
      "mason-lspconfig.server_configurations.julials.init"
      "mason-lspconfig.server_configurations.pylsp.init"
      "mason-lspconfig.ensure_installed"
      "mason-lspconfig.api.command"
      "mason-lspconfig.mappings.server"
      "mason-lspconfig.mappings.language"
      "mason-lspconfig.typescript"
      "mason-lspconfig.lspconfig_hook"
    ];
  };
  mason-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "mason-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "williamboman";
      repo = "mason.nvim";
      rev = "fc98833b6da5de5a9c5b1446ac541577059555be";
      sha256 = "sha256-5XlzwN4tLXsdP6XnpA3r2bvkEIiHM7qfF4nSr4pj4bw=";
    };
    nvimSkipModules = [ "mason-vendor.zzlib.inflate-bwo" ];
  };
  mason-tool-installer-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "mason-tool-installer-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "WhoIsSethDaniel";
      repo = "mason-tool-installer.nvim";
      rev = "5639d58a3d11ff7c05c8e31e159bfedae55d7961";
      sha256 = "sha256-KUX0bmh3x1w37dhfON6QMaXNBUTHgAwQD7XJyJhpLxE=";
    };
    nvimSkipModules = [
      "mason-tool-installer"
    ];
  };
  neotest = pkgs.vimUtils.buildVimPlugin {
    name = "neotest";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-neotest";
      repo = "neotest";
      rev = "dddbe8fe358b05b2b7e54fe4faab50563171a76d";
      sha256 = "sha256-a42VdqpE/HP3w5tzZIKr7QTq0qJuoq7ddSHr6LwvJko=";
    };
    nvimSkipModules = [
      "neotest.consumers.watch.init"
      "neotest.consumers.benchmark"
      "neotest.consumers.summary.init"
      "neotest.consumers.summary.component"
      "neotest.consumers.summary.summary"
      "neotest.lib.ui.init"
      "neotest.lib.ui.float"
      "neotest.lib.treesitter.init"
      "neotest.lib.file.init"
      "neotest.lib.file.find"
      "neotest.lib.subprocess"
      "neotest.lib.window"
      "neotest.lib.positions.init"
      "neotest.lib.process.init"
      "neotest.client.init"
      "neotest.client.strategies.init"
      "neotest.client.strategies.integrated.init"
      "neotest.client.strategies.dap.init"
      "neotest.client.state.init"
      "neotest.client.events.init"
      "neotest.client.runner"
      "neotest.logging"
      "neotest"
      "neotest.types.init"
      "neotest.types.fanout_accum"
      "neotest.async"
      "neotest.utils.init"
      "neotest.adapters.init"
      "neotest.consumers.diagnostic"
      "neotest.consumers.init"
      "neotest.consumers.jump"
      "neotest.consumers.state.init"
      "neotest.consumers.output_panel.init"
      "neotest.consumers.run"
      "neotest.consumers.quickfix"
      "neotest.consumers.status"
      "neotest.consumers.output"
      "neotest.consumers.watch.watcher"
    ];
  };
  nvim-nio = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-nio";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-neotest";
      repo = "nvim-nio";
      rev = "21f5324bfac14e22ba26553caf69ec76ae8a7662";
      sha256 = "sha256-eDbzJAGdUBhTwuD0Nt9FihZj1MmVdQfn/GKIybuu5a8=";
    };
  };
  FixCursorHold-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "FixCursorHold-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "antoinemadec";
      repo = "FixCursorHold.nvim";
      rev = "1900f89dc17c603eec29960f57c00bd9ae696495";
      sha256 = "sha256-HwaKkwANoNHe512eDvuOJ48tG8nDh7r67magi8OA/Vw=";
    };
  };
  nvim-autopairs = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-autopairs";
    src = pkgs.fetchFromGitHub {
      owner = "windwp";
      repo = "nvim-autopairs";
      rev = "68f0e5c3dab23261a945272032ee6700af86227a";
      sha256 = "sha256-FUnYZWSJh5wAfXevH+nK+g/s4WhnzwxbW6a3gUDQI6o=";
    };
    nvimSkipModules = [
      "nvim-autopairs.completion.cmp"
      "nvim-autopairs.completion.compe"
    ];
  };
  nvim-lspconfig = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-lspconfig";
    src = pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lspconfig";
      rev = "a3f8422b752e03334dbaf4a46940d8aee0acdebf";
      sha256 = "sha256-qWm3X65Jt/5Ldi2Bremv0hBwQTVHx0k8okKZ1hdRGhQ=";
    };
  };
  nvim-treesitter-context = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-treesitter-context";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-context";
      rev = "198720b4016af04c9590f375d714d5bf8afecc1a";
      sha256 = "sha256-MSfSbepp+sA0GHz2StzgcQgWMhd04fmW9swmUGLiuo4=";
    };
    nvimSkipModules = [ "install_parsers" ];
  };
  nvim-treesitter-textobjects = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-treesitter-textobjects";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "nvim-treesitter-textobjects";
      rev = "ab0950c53d1ae04da8e488aa762b450d5241dca2";
      sha256 = "sha256-fOE9KAFWcd2ptpecrW6AqXFZeXa7SKqWGg129LQlmes=";
    };
    nvimSkipModules = [
      "nvim-treesitter-textobjects"
      "nvim-treesitter.textobjects.shared"
      "nvim-treesitter.textobjects.move"
      "nvim-treesitter.textobjects.swap"
      "nvim-treesitter.textobjects.lsp_interop"
      "nvim-treesitter.textobjects.attach"
      "nvim-treesitter.textobjects.repeatable_move"
      "nvim-treesitter.textobjects.select"
    ];
  };
  nvim-web-devicons = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-web-devicons";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-tree";
      repo = "nvim-web-devicons";
      rev = "1020869742ecb191f260818234517f4a1515cfe8";
      sha256 = "sha256-WOFtHvNlPP1JRLdCfFRXEOUx+1z5d5ncm+pS0wpDjAg=";
    };
  };
  plenary-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "plenary-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-lua";
      repo = "plenary.nvim";
      rev = "857c5ac632080dba10aae49dba902ce3abf91b35";
      sha256 = "sha256-8FV5RjF7QbDmQOQynpK7uRKONKbPRYbOPugf9ZxNvUs=";
    };
    nvimSkipModules = [
      "plenary.neorocks.init"
      "plenary._meta._luassert"
    ];
  };
  nvim-colorizer-lua = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-colorizer-lua";
    src = pkgs.fetchFromGitHub {
      owner = "norcalli";
      repo = "nvim-colorizer.lua";
      rev = "a065833f35a3a7cc3ef137ac88b5381da2ba302e";
      sha256 = "sha256-gjO89Sx335PqVgceM9DBfcVozNjovC8KML1OZCRNMGw=";
    };
  };
  rustaceanvim = pkgs.vimUtils.buildVimPlugin {
    name = "rustaceanvim";
    src = pkgs.fetchFromGitHub {
      owner = "mrcjkb";
      repo = "rustaceanvim";
      rev = "2b0f0b7e03751cf8ed123322f9b02d8f73fa9df7";
      sha256 = "sha256-kb25N7Iv/NZKfbnJs6l8xj4CKqz48jIX17jPueMrX2Q=";
    };
    nvimSkipModules = [ "rustaceanvim.neotest.init" ];
  };
  dir-telescope = pkgs.vimUtils.buildVimPlugin {
    name = "dir-telescope";
    src = pkgs.fetchFromGitHub {
      owner = "princejoogie";
      repo = "dir-telescope.nvim";
      rev = "805405b9f98dc3470f8676773dc0e6151a9158ed";
      sha256 = "sha256-B/cZUkjAVi52jopBwZJYmiaVf8PqnawusnSGOx7dDqs=";
    };
    nvimSkipModules = [
      "dir-telescope"
      "dir-telescope.settings"
      "dir-telescope.util.init"
      "dir-telescope.features.grep-in-dir"
      "dir-telescope.features.find-in-dir"
    ];
  };
  telescope-fzf-native-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "telescope-fzf-native-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-fzf-native.nvim";
      rev = "2a5ceff981501cff8f46871d5402cd3378a8ab6a";
      sha256 = "sha256-0dGvpN8Vn+aU6j8N0tTD8AOzOAHGemlPAcLKyqlWvlg=";
    };
    nvimSkipModules = [ "fzf_lib" ];
  };
  telescope-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "telescope-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope.nvim";
      rev = "814f102cd1da3dc78c7d2f20f2ef3ed3cdf0e6e4";
      sha256 = "sha256-Di0UIBXcnReT+6BaCdzTTg2j7oGzzXw6KfS4VbrBelE=";
    };
    nvimSkipModules = [
      "telescope._"
      "telescope.actions.generate"
      "telescope.actions.history"
      "telescope.actions.init"
      "telescope.actions.layout"
      "telescope.actions.set"
      "telescope.actions.state"
      "telescope.actions.utils"
      "telescope.builtin.__diagnostics"
      "telescope.builtin.__files"
      "telescope.builtin.__git"
      "telescope.builtin.__internal"
      "telescope.builtin.__lsp"
      "telescope.command"
      "telescope.config"
      "telescope.entry_manager"
      "telescope.finders"
      "telescope.finders.async_job_finder"
      "telescope.finders.async_oneshot_finder"
      "telescope.finders.async_static_finder"
      "telescope.from_entry"
      "telescope.log"
      "telescope.make_entry"
      "telescope.mappings"
      "telescope.pickers"
      "telescope.pickers.entry_display"
      "telescope.pickers.highlights"
      "telescope.previewers.buffer_previewer"
      "telescope.previewers.init"
      "telescope.previewers.previewer"
      "telescope.previewers.term_previewer"
      "telescope.previewers.utils"
      "telescope.sorters"
      "telescope.testharness.init"
      "telescope.utils"
    ];
  };
  telescope-ui-select-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "telescope-ui-select-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-telescope";
      repo = "telescope-ui-select.nvim";
      rev = "6e51d7da30bd139a6950adf2a47fda6df9fa06d2";
      sha256 = "sha256-YRhNmmG4gx9Ht8JwjQfbTjJyTHEuZmtP6lqnhOsk8bE=";
    };
  };
  vim-rhubarb = pkgs.vimUtils.buildVimPlugin {
    name = "vim-rhubarb";
    src = pkgs.fetchFromGitHub {
      owner = "tpope";
      repo = "vim-rhubarb";
      rev = "386daa2e9d98e23e27ad089afcbe5c5a903e488d";
      sha256 = "sha256-w9Pzj+iExBPZl4O0VhTS2i0dTHXmwtjuPF2Lcj71qb4=";
    };
  };
  vim-nix = pkgs.vimUtils.buildVimPlugin {
    name = "vim-nix";
    src = pkgs.fetchFromGitHub {
      owner = "LnL7";
      repo = "vim-nix";
      rev = "7235c7ce2cea530cb6b59bc3e46d4bfe917d15c8";
      sha256 = "sha256-Hmn8EVlvMQnQF8COeb89cgl5+A83kagOjGsmvm5WNoE=";
    };
  };
  vim-fugitive = pkgs.vimUtils.buildVimPlugin {
    name = "vim-fugitive";
    src = pkgs.fetchFromGitHub {
      owner = "tpope";
      repo = "vim-fugitive";
      rev = "4a745ea72fa93bb15dd077109afbb3d1809383f2";
      sha256 = "sha256-1AteNwnc7lCHLIwM8Ejm2T9VTIDM+CeAfvAUeSQRFKE=";
    };
  };
  typescript-tools-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "typescript-tools-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "pmizio";
      repo = "typescript-tools.nvim";
      rev = "35e397ce467bedbbbb5bfcd0aa79727b59a08d4a";
      sha256 = "sha256-x32NzZYFK6yovlvE3W8NevYA0UT0qvwKle1irFwmuvM=";
    };
    nvimSkipModules = [
      "typescript-tools.tsserver"
      "typescript-tools"
      "typescript-tools.async"
      "typescript-tools.protocol.text_document.code_action.init"
      "typescript-tools.protocol.initialize"
      "typescript-tools.capabilities"
      "typescript-tools.tsserver_provider"
      "typescript-tools.api"
      "typescript-tools.internal_commands"
      "typescript-tools.autocommands.jsx_close_tag"
      "typescript-tools.autocommands.init"
      "typescript-tools.autocommands.diagnostics"
      "typescript-tools.rpc"
      "typescript-tools.user_commands"
      "typescript-tools.process"
    ];
  };
  tokyonight-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "tokyonight-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "tokyonight.nvim";
      rev = "057ef5d260c1931f1dffd0f052c685dcd14100a3";
      sha256 = "sha256-1xZhQR1BhH2eqax0swlNtnPWIEUTxSOab6sQ3Fv9WQA=";
    };
    nvimSkipModules = [
      "tokyonight.extra.fzf"
      "tokyonight.docs"
    ];
  };
  #  = pkgs.vimUtils.buildVimPlugin {
  #   name = "";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "";
  #     repo = "";
  #     rev = "";
  #     sha256 = "";
  #   };
  # };
  plugins = [
    FixCursorHold-nvim
    barbar-nvim
    comment-nvim
    conform-nvim
    crates-nvim
    cyberpunk-nvim
    dir-telescope
    fidget-nvim
    friendly-snippets
    gitsigns-nvim
    grug-far-nvim
    gruvbox-nvim
    heirline-components-nvim
    heirline-nvim
    hop-nvim
    lazydev-nvim
    luasnip
    luvit-meta
    mason-lspconfig-nvim
    mason-nvim
    mason-tool-installer-nvim
    neotest
    nvim-autopairs
    nvim-colorizer-lua
    nvim-lspconfig
    nvim-nio
    nvim-treesitter-context
    nvim-treesitter-textobjects
    nvim-web-devicons
    pest-nvim
    pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    blink-cmp
    plenary-nvim
    rustaceanvim
    statuscolumn-nvim
    telescope-fzf-native-nvim
    telescope-nvim
    telescope-ui-select-nvim
    tint-nvim
    todo-comments-nvim
    tokyonight-nvim
    typescript-tools-nvim
    vim-fugitive
    vim-nix
    vim-rhubarb
    yazi-nvim
  ];
in
plugins
