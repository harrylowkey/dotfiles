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
      require("config.lsp.plugins.lspsaga")
    end,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "deep",
      })
      require("onedark").load()
    end,
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("config.plugins.lualine")
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({ -- Optional, you don't have to run setup.
        groups = {                -- table: default groups
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = {}, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      })
    end,
  },
}
