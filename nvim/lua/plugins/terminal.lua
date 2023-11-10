return {
  { "szw/vim-maximizer" },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("config.plugins.toggle-term")
    end,
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("config.plugins.trouble")
    end,
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("config.plugins.todo-comment")
    end,
  },
}
