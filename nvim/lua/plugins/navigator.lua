return {
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile", "NvimTreeFindFileToggle", "NvimTreeResize" },
    config = function()
      require("config.plugins.nvim-tree")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "cljoly/telescope-repo.nvim",
    },
    config = function()
      require("config.plugins.telescope")
    end,
  },
}
