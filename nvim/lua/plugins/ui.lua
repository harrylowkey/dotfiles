return {
  -- theme
  { "sainnhe/gruvbox-material", lazy = true },
  ---
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("config.plugins.transparent")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("config.plugins.nvim-web-devicons")
    end,
  },
  { "onsails/lspkind.nvim", lazy = true },
  {
    "rcarriga/nvim-notify",
    lazy = true,
    config = function()
      require("config.plugins.nvim-notify")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function()
      require("config.plugins.noice")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("config.plugins.lualine")
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    config = function()
      require("dropbar").setup({
        bar = {
          enable = function(buf, win, _)
            if
              not vim.api.nvim_buf_is_valid(buf)
              or not vim.api.nvim_win_is_valid(win)
              or vim.fn.win_gettype(win) ~= ""
              or vim.wo[win].diff
              or vim.api.nvim_win_get_config(win).zindex
              or vim.bo[buf].buftype ~= ""
            then
              return false
            end
            return vim.bo[buf].ft ~= "alpha" and vim.bo[buf].ft ~= "dashboard"
          end,
        },
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
    config = function()
      require("config.plugins.indent-blankline")
    end,
  },
}
