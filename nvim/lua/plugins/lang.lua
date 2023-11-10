return {
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "jayp0521/mason-null-ls.nvim" },
  { "neovim/nvim-lspconfig" },
  { "rafamadriz/friendly-snippets" },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("lsp.plugins.null-ls")
    end,
  },
}
