return {
  { "rafamadriz/friendly-snippets" },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp.init")
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("config.lsp.plugins.mason")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("config.lsp.plugins.mason-lspconfig")
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = function()
      require("config.lsp.plugins.lspsaga")
    end,
  },
  {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    dependencies = "nvim-lspconfig",
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
  -- {
  --     "jay-babu/mason-nvim-dap.nvim",
  --     config = function()
  --         require("config.lsp.plugins.mason-nvim-dap")
  --     end,
  -- },
}
