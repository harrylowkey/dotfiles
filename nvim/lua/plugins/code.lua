return {
  { "nvim-lua/plenary.nvim" },
  { "LudoPinelli/comment-box.nvim" },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  {
    "sunjon/shade.nvim",
    config = function()
      require("shade").setup()
      require("shade").toggle()
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("config.plugins.indent")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("config.plugins.colorizer")
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim" },
    config = function()
      require("config.plugins.ufo")
    end,
  }, -- folding
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("config.plugins.harpoon")
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("spectre").setup()
    end,
  },
}
