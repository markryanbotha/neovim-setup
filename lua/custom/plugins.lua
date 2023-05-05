local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
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
        -- "vue", "svelte",
        --

        -- low level
        "c",
        "zig",
      },
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
        "eslint_d",
        "tailwindcss-language-server",
        "css-lsp",
        "prisma-language-server",
        "astro-language-server",
        "yaml-language-server",
      },
    },
  },
  {
    "MunifTanjim/eslint.nvim",
    config = function()
      require "custom.configs.eslint"
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
}

return plugins
