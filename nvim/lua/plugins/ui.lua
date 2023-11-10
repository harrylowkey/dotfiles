return {
  { "nvim-tree/nvim-web-devicons" },
  { "onsails/lspkind.nvim" },
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("config.plugins.noice")
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
      require("lsp.plugins.lspsaga")
    end,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup()
    end,
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("config.plugins.lualine")
    end,
  }, -- vs-code like icons for autocompletion
}
