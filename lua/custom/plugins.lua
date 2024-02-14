local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "prisma",
        "astro",
        "yaml",
        "tsx",
        -- "vue", "svelte",
        --
        -- others
        "sql",

        -- low level
        "c",
        "zig",
      },
    },
    context_commentstring = {
      enable = true,
    },
  },
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "prettierd",
        "stylua",
        "typescript-language-server",
        "eslint-lsp",
        "tailwindcss-language-server",
        "css-lsp",
        "prisma-language-server",
        "astro-language-server",
        "yaml-language-server",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    -- keys = { "gc", "gb" },
    init = function()
      require("core.utils").load_mappings "comment"
    end,
    config = function()
      -- Adding custom config to get comments working in tsx with ts_context_commentstring
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "David-Kunz/jester",
    config = function()
      require "custom.configs.jest"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "custom.configs.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "davidosomething/format-ts-errors.nvim",
  },
  { "folke/lsp-colors.nvim" },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    config = function()
      require("lazygit.utils").project_root_dir()
    end,
  },
  { "tpope/vim-sleuth",     lazy = false },
  { "rcarriga/cmp-dap" },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "custom.configs.cmp"
    end,
  },
}

return plugins
