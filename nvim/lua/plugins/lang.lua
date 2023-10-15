return {
  {"williamboman/mason.nvim"}, {"williamboman/mason-lspconfig.nvim"},
  {"jose-elias-alvarez/null-ls.nvim"}, {"jayp0521/mason-null-ls.nvim"},
  {"neovim/nvim-lspconfig"}, {"hrsh7th/cmp-nvim-lsp"}, -- autocompletion
  {
    "pmizio/typescript-tools.nvim",
	dependencies = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
  },
  {"L3MON4D3/LuaSnip"}, {"saadparwaiz1/cmp_luasnip"}, {"rafamadriz/friendly-snippets"},
  {"hrsh7th/nvim-cmp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"}
}
