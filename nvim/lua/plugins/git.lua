return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("config.plugins.git-signs")
    end,
  },
  { "sindrets/diffview.nvim" },
}
