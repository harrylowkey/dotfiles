return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "friendly-snippets",
      {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
        opts = {},
      },
    },
    config = function()
      require("config.plugins.nvim-cmp")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = "nvim-cmp",
    build = "make install_jsregexp",
    config = function()
      require("config.plugins.lua_snip")
    end,
  },
  { "saadparwaiz1/cmp_luasnip", dependencies = "LuaSnip" },
  { "hrsh7th/cmp-nvim-lua",     dependencies = "cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp",     dependencies = "cmp-nvim-lua" }, -- autocompletion
  { "hrsh7th/cmp-buffer",       dependencies = "cmp-nvim-lsp" },
  { "hrsh7th/cmp-path",         dependencies = "cmp-nvim-lsp" },
  { "hrsh7th/cmp-cmdline" },
}
